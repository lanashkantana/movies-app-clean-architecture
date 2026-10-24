import 'package:film_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.id, super.backDropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'],
      backDropPath: json['backdrop_path'] ?? "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
    );
  }
}
