import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entity/movie_entity.dart';
import 'package:movies_app/movies/domain/repos/base_movie_repo.dart';

class GetTopRatedMoviesUseCase
    implements BaseUseCase<List<MovieEntity>, NoParams> {
  final BaseMoviesRepo baseMoviesRepo;

  GetTopRatedMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await baseMoviesRepo.getTopRatedMovies();
  }
}
