import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/error_exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movie_paramaters.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class MoviesRepository implements BaseMoviesRepository {
  final BaseMoviesRemoteDataSources baseMoviesRemoteDataSources;

  MoviesRepository(this.baseMoviesRemoteDataSources);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final results = await baseMoviesRemoteDataSources.getNowPlayingMovies();
      return Right(results);
    } on ServerException catch (se) {
      return Left(ServerFailure(se.exceptionMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final results = await baseMoviesRemoteDataSources.getPopularMovies();
      return Right(results);
    } on ServerException catch (se) {
      return Left(ServerFailure(se.exceptionMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final results = await baseMoviesRemoteDataSources.getTopRatedMovies();
      return Right(results);
    } on ServerException catch (se) {
      return Left(ServerFailure(se.exceptionMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParams params) async{
    try {
      final results = await baseMoviesRemoteDataSources.getMovieDetails(params);
      return Right(results);
    } on ServerException catch (se) {
      return Left(ServerFailure(se.exceptionMessage));
    }
  }  
}
