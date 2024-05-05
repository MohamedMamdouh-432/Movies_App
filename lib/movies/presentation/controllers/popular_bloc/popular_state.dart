part of 'popular_bloc.dart';

class PopularState extends Equatable {
  final List<Movie> movies;
  final RequestState requestStatus;
  final String message;

  const PopularState({
    this.movies = const [],
    this.requestStatus = RequestState.loading,
    this.message = '',
  });
  
  PopularState copyWith({
  List<Movie>? movies,
  RequestState? requestStatus,
  String? message,
}) {
  return PopularState(
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
