part of 'top_rated_bloc.dart';

class TopRatedState extends Equatable {
  final List<Movie> movies;
  final RequestState requestStatus;
  final String message;

  const TopRatedState({
    this.movies = const [],
    this.requestStatus = RequestState.loading,
    this.message = '',
  });

  TopRatedState copyWith({
    List<Movie>? movies,
    RequestState? requestStatus,
    String? message,
  }) {
    return TopRatedState(
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
