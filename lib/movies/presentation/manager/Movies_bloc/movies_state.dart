// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entity/movie_entity.dart';

class MoviesState extends Equatable {
  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayinMessage;
  final List<MovieEntity> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<MovieEntity> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayinMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  MoviesState copyWith({
    List<MovieEntity>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayinMessage,
    List<MovieEntity>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<MovieEntity>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayinMessage: nowPlayinMessage ?? this.nowPlayinMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object> get props {
    return [
      nowPlayingMovies,
      nowPlayingState,
      nowPlayinMessage,
      popularMovies,
      popularState,
      popularMessage,
      topRatedMovies,
      topRatedState,
      topRatedMessage,
    ];
  }
}
