import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecases/get_nowplaying_movies.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final NowPlayingMoviesService _nowPlayingMoviesGetter;

  NowPlayingBloc(NowPlayingMoviesService gnpm)
      : _nowPlayingMoviesGetter = gnpm,
        super(const NowPlayingState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
  }

  Future<void> _getNowPlayingMovies(event, emit) async {
    emit(state.copyWith());
    final result = await _nowPlayingMoviesGetter(const NoParameters());
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
