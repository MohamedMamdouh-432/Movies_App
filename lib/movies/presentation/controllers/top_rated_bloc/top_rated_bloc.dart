import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final TopRatedMoviesService _topRatedMoviesGetter;

  TopRatedBloc(TopRatedMoviesService gtrm)
      : _topRatedMoviesGetter = gtrm,
        super(const TopRatedState()) {
    on<TopRatedEvent>(_getTopRatedMovies);
  }

  Future<void> _getTopRatedMovies(event, emit) async {
    emit(state.copyWith());
    final result = await _topRatedMoviesGetter(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.errorMessage,
          requestStatus: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movies: r,
          requestStatus: RequestState.loaded,
        ),
      ),
    );
  }
}
