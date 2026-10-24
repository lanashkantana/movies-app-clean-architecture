import 'package:film_app/movies/data/models/geners_model.dart';
import 'package:film_app/movies/domain/entities/movie_detail.dart';
import 'package:film_app/movies/domain/entities/geners.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

// 1. هذا هو المحوّل السحري: مهمته يترجم الـ Geners للمكتبة
class GenersConverter implements JsonConverter<List<Geners>, List<dynamic>> {
  const GenersConverter();

  @override
  List<Geners> fromJson(List<dynamic> json) {
    return json.map((e) => GenersModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  List<dynamic> toJson(List<Geners> object) => [];
}

// 2. نضع المحول فوق الكلاس ليفهم كل المتغيرات الموروثة
@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@GenersConverter() // 👈 السحر هنا!
class MovieDetailsModel extends MovieDetail {
  
  const MovieDetailsModel({
    required super.genres, // رجعناها طبيعية 100% وبدون أي مشاكل!
    required super.backDropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);
}