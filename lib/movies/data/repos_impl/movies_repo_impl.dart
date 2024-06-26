import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/data_source/remote_movie_data_source.dart';
import 'package:movies_app/movies/domain/entity/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entity/movie_entity.dart';
import 'package:movies_app/movies/domain/entity/recommendations_entity.dart';
import 'package:movies_app/movies/domain/repos/base_movie_repo.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendations_usecase.dart';

class MoviesRepoImpl implements BaseMoviesRepo {
  final BaseRemoteMovieDataSource baseRemoteMovieDataSource;

  MoviesRepoImpl(this.baseRemoteMovieDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    final result = await baseRemoteMovieDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(Failure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    final result = await baseRemoteMovieDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final result = await baseRemoteMovieDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      MovieDetailsParams params) async {
    final result = await baseRemoteMovieDataSource.getMovieDetails(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationsEntity>>> getRecommendations(
      RecommendationsParams param) async {
    final result = await baseRemoteMovieDataSource.getRecommendations(param);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
