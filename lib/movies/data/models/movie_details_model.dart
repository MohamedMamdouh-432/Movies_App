import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.overview,
    required super.title,
    required super.backdropPath,
    required super.releaseDate,
    required super.runtime,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieDetailsModel(
      id: int.parse(jsonData['id'].toString()),
      runtime: int.parse(jsonData['runtime']),
      title: jsonData['title'],
      backdropPath: jsonData['backdrop_path'],
      overview: jsonData['overview'],
      voteAverage: jsonData['vote_average'].toDouble(),
      releaseDate: jsonData['release_date'],
      genres: List<String>.from(jsonData['genres'].map((e) => e['name'])),
    );
  }
}
