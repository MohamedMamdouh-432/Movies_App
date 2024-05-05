import 'package:dio/dio.dart';
import 'package:movies_app/core/error/error_exceptions.dart';
import 'package:movies_app/core/utils/api_constants.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movie_paramaters.dart';

abstract class BaseMoviesRemoteDataSources {
  final Dio _moviesDio;

  const BaseMoviesRemoteDataSources(Dio dio) : _moviesDio = dio;

  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetails> getMovieDetails(MovieDetailsParams params);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSources {
  const MoviesRemoteDataSource(super.moviesDio);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await _moviesDio.get(ApiConstants.nowPlayingMoviesUrl);
    if (response.statusCode == 200) {
      return List.from(response.data['results'])
          .map((element) => MovieModel.fromJson(element))
          .toList();
    } else {
      throw ServerException(
        exceptionMessage: response.data['status_message'],
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await _moviesDio.get(ApiConstants.popularMoviesUrl);
    if (response.statusCode == 200) {
      return List.from(response.data['results'])
          .map((element) => MovieModel.fromJson(element))
          .toList();
    } else {
      throw ServerException(
        exceptionMessage: response.data['status_message'],
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await _moviesDio.get(ApiConstants.topRatedMoviesUrl);
    if (response.statusCode == 200) {
      return List.from(response.data['results'])
          .map((element) => MovieModel.fromJson(element))
          .toList();
    } else {
      throw ServerException(
        exceptionMessage: response.data['status_message'],
      );
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(MovieDetailsParams params) async {
    final response = await _moviesDio.get(ApiConstants.getMovieDetailsUrl(params.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        exceptionMessage: response.data['status_message'],
      );
    }
  }
}
