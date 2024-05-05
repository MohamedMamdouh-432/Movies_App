import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final int id, runtime;
  final double voteAverage;
  final String title, overview, backdropPath, releaseDate;
  final List<String> genres;

  const MovieDetails({
    required this.id,
    required this.overview,
    required this.title,
    required this.backdropPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object> get props {
    return [
      id,
      overview,
      title,
      backdropPath,
      releaseDate,
      runtime,
      voteAverage,
      genres,
    ];
  }
}
