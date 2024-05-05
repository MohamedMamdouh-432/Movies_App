import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final PopularMoviesService _popularMoviesGetter;

  PopularBloc(PopularMoviesService gpm)
      : _popularMoviesGetter = gpm,
        super(const PopularState()) {
    on<GetPopularMoviesEvent>(_getPopularMovies);
  }

  Future<void> _getPopularMovies(event, emit) async {
    emit(state.copyWith());
    final result = await _popularMoviesGetter(const NoParameters());
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
