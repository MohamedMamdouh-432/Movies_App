import 'package:equatable/equatable.dart';

class MovieDetailsParams extends Equatable {
  final int movieId;

  const MovieDetailsParams(this.movieId);

  @override
  List<Object> get props => [movieId];
}
