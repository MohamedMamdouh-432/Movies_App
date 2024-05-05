part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState requestStatus;
  final String message;

  const MovieDetailsState({
    this.movieDetails,
    this.requestStatus = RequestState.loading,
    this.message = '',
  });
  
  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? requestStatus,
    String? message,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      requestStatus: requestStatus ?? this.requestStatus,
      message: message ?? this.message,
    );
  }
  
  @override
  List<Object> get props => [
    movieDetails!, 
    requestStatus, 
    message,
  ];
}
