// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entity/genres_entity.dart';

class MovieDetailsEntity extends Equatable {
  final List<GenresEntity> genres;
  final String posterPath;
  final String overview;
  final int id;
  final String releaseDate;
  final int runtime;
  final String title;
  final num voteAverage;

  const MovieDetailsEntity({
    required this.genres,
    required this.posterPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props {
    return [
      genres,
      posterPath,
      overview,
      id,
      releaseDate,
      runtime,
      title,
      voteAverage,
    ];
  }
}
