import 'package:movies_app/movies/domain/entity/genres_entity.dart';

class GenresModel extends GenresEntity {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json['id'],
        name: json['name'],
      );
}
