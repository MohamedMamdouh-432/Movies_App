part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetRecommendationsEvent extends MovieDetailsEvent {
  final int id;
  const GetRecommendationsEvent(this.id);

  @override
  List<Object> get props => [id];
}
