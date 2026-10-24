import 'package:json_annotation/json_annotation.dart';
import 'package:film_app/movies/domain/entities/geners.dart';

// سطر واحد فقط للتوليد (لأننا حذفنا Freezed)
part 'geners_model.g.dart';

@JsonSerializable()
class GenersModel extends Geners {
  const GenersModel({required super.id, required super.name});

  // توليد دالة fromJson تلقائياً
  factory GenersModel.fromJson(Map<String, dynamic> json) =>
      _$GenersModelFromJson(json);

  // توليد دالة toJson تلقائياً
  Map<String, dynamic> toJson() => _$GenersModelToJson(this);
}
