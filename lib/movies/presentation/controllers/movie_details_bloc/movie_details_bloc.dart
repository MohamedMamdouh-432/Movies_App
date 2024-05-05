import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movie_paramaters.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsService _moviedetailsGetter;

  MovieDetailsBloc(MovieDetailsService mds)
      : _moviedetailsGetter = mds,
        super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  Future<void> _getMovieDetails(GetMovieDetailsEvent event, emit) async {
    emit(state.copyWith());
    final result = await _moviedetailsGetter(MovieDetailsParams(event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.errorMessage,
          requestStatus: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          requestStatus: RequestState.loaded,
        ),
      ),
    );
  }
}
