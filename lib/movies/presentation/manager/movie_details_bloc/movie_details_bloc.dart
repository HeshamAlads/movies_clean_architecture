import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/presentation/manager/movie_details_bloc/movie_details_state.dart';

part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationsUseCase getRecommendationMoviesUseCase;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase, this.getRecommendationMoviesUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationMoviesEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParams(movieId: event.id));

    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsMessage: l.message,
          movieDetailsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetRecommendationMoviesEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationMoviesUseCase(
        RecommendationsParams(movieId: event.id));

    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationsMessage: l.message,
          recommendationsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendations: r,
          recommendationsState: RequestState.success,
        ),
      ),
    );
  }
}
