import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.genIds,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
      id: int.parse(jsonData['id'].toString()),
      title: jsonData['title'],
      backdropPath: jsonData['backdrop_path'],
      overview: jsonData['overview'],
      voteAverage: jsonData['vote_average'].toDouble(),
      releaseDate: jsonData['release_date'],
      genIds: List<int>.from(jsonData['genre_ids']),
    );
  }
}
