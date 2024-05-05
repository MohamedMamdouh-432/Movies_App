import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final double voteAverage;
  final String title, overview, backdropPath, releaseDate;
  final List<int> genIds;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.genIds,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        voteAverage,
        title,
        overview,
        backdropPath,
        genIds,
        releaseDate,
      ];
}
