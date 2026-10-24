import 'package:film_app/movies/domain/entities/recommendation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'recommendation_model.g.dart';

@JsonSerializable()
class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.id, super.backDropPath});

factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendationModelFromJson(json);

  
}
