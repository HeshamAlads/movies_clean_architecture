// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entity/movie_details_entity.dart';
import 'package:movies_app/movies/domain/repos/base_movie_repo.dart';

class GetMovieDetailsUseCase
    implements BaseUseCase<MovieDetailsEntity, MovieDetailsParams> {
  final BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailsUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
      MovieDetailsParams param) async {
    return await baseMoviesRepo.getMovieDetails(param);
  }
}

class MovieDetailsParams extends Equatable {
  final int movieId;

  const MovieDetailsParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
