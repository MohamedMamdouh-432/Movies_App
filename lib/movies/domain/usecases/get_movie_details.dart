import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movie_paramaters.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class MovieDetailsService extends BaseUseCase<MovieDetails, MovieDetailsParams> {
  final BaseMoviesRepository baseMoviesRepo;

  MovieDetailsService(this.baseMoviesRepo);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParams p) async {
    return await baseMoviesRepo.getMovieDetails(p);
  }
}
