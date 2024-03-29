import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entity/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entity/movie_entity.dart';
import 'package:movies_app/movies/domain/entity/recommendations_entity.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendations_usecase.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();

  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      MovieDetailsParams param);

  Future<Either<Failure, List<RecommendationsEntity>>> getRecommendations(
      RecommendationsParams param);
}
