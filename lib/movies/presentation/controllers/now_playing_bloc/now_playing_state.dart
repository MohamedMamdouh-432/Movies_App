part of 'now_playing_bloc.dart';

class NowPlayingState extends Equatable {
  final List<Movie> movies;
  final RequestState requestStatus;
  final String message;

  const NowPlayingState({
    this.movies = const [],
    this.requestStatus = RequestState.loading,
    this.message = '',
  });

  NowPlayingState copyWith({
    List<Movie>? movies,
    RequestState? requestStatus,
    String? message,
  }) {
    return NowPlayingState(
      movies: movies ?? this.movies,
      requestStatus: requestStatus ?? this.requestStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        movies,
        message,
        requestStatus,
      ];
}
