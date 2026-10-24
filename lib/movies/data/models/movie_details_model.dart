import 'package:film_app/movies/data/models/geners_model.dart';
import 'package:film_app/movies/domain/entities/movie_detail.dart';
import 'package:film_app/movies/domain/entities/geners.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailsModel extends MovieDetail {
  // تم حذف الـ @override final List<GenersModel> genres بالكامل!

  const MovieDetailsModel({
    // المهندسون المحترفون يوجهون المكتبة للتحويل هنا مباشرة:
    @JsonKey(fromJson: _genresListFromJson) required super.genres,
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

// دالة خارجية نظيفة جداً وظيفتها الوحيدة إخبار المكتبة كيف تفك تشفير هذه المصفوفة
List<Geners> _genresListFromJson(List<dynamic> json) {
  return json.map((e) => GenersModel.fromJson(e as Map<String, dynamic>)).toList();
}