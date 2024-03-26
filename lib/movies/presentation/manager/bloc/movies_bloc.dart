// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_usecase.dart';
import 'package:movies_app/movies/presentation/manager/bloc/movies_event.dart';
import 'package:movies_app/movies/presentation/manager/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(getTopRatedMovies);
  }

  FutureOr<void> getTopRatedMovies(event, emit) async {
    final result = await getTopRatedMoviesUseCase();

    result.fold(
        (l) => emit(
              state.copyWith(
                  topRatedMessage: l.message,
                  topRatedState: RequestState.error),
            ),
        (r) => emit(state.copyWith(
              topRatedMovies: r,
              topRatedState: RequestState.success,
            )));
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    final result = await getPopularMoviesUseCase();

    result.fold(
        (l) => emit(
              state.copyWith(
                  popularMessage: l.message, popularState: RequestState.error),
            ),
        (r) => emit(state.copyWith(
              popularMovies: r,
              popularState: RequestState.success,
            )));
  }

  FutureOr<void> _getNowPlayingMovies(event, emit) async {
    final result = await getNowPlayingMoviesUseCase();

    result.fold(
        (l) => emit(
              state.copyWith(
                  nowPlayinMessage: l.message,
                  nowPlayingState: RequestState.error),
            ),
        (r) => emit(state.copyWith(
              nowPlayingMovies: r,
              nowPlayingState: RequestState.success,
            )));
  }
}
