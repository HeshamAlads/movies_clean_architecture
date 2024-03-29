import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entity/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.genres,
    required super.posterPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        genres: List<GenresModel>.from(
            json['genres'].map((e) => GenresModel.fromJson(e))),
        posterPath: json['poster_path'],
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'],
      );
}
