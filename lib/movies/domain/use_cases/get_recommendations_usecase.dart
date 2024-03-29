import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entity/recommendations_entity.dart';
import 'package:movies_app/movies/domain/repos/base_movie_repo.dart';

class GetRecommendationsUseCase
    implements BaseUseCase<List<RecommendationsEntity>, RecommendationsParams> {
  final BaseMoviesRepo baseMoviesRepo;

  GetRecommendationsUseCase(this.baseMoviesRepo);
  @override
  Future<Either<Failure, List<RecommendationsEntity>>> call(
      RecommendationsParams param) async {
    return await baseMoviesRepo.getRecommendations(param);
  }
}

class RecommendationsParams extends Equatable {
  final int movieId;
  const RecommendationsParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
