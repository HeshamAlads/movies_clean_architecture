import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entity/movie_entity.dart';
import 'package:movies_app/movies/domain/repos/base_movie_repo.dart';

class GetPopularMoviesUseCase implements BaseUseCase {
  final BaseMoviesRepo baseMovieRepo;

  GetPopularMoviesUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await baseMovieRepo.getPopularMovies();
  }
}
