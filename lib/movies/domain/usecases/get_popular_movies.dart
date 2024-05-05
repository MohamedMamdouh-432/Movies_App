import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class PopularMoviesService extends BaseUseCase<List<Movie>, NoParameters>  {
  final BaseMoviesRepository baseMoviesRepo;

  PopularMoviesService(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters p) async {
    return await baseMoviesRepo.getPopularMovies();
  }
}
