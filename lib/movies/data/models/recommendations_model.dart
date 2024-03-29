import 'package:movies_app/movies/domain/entity/recommendations_entity.dart';

class RecommendationsModel extends RecommendationsEntity {
  const RecommendationsModel({required super.id, required super.backdropPath});

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(
        id: json['id'],
        backdropPath: json['backdrop_path'] ?? 'zAepSrO99owYwQqi0QG2AS0dHXw.jpg',
      );
}
