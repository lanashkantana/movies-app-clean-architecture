// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  backDropPath: json['backDropPath'] as String,
  genreIds: (json['genreIds'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  overview: json['overview'] as String,
  voteAverage: (json['voteAverage'] as num).toDouble(),
  releaseDate: json['releaseDate'] as String,
);

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backDropPath': instance.backDropPath,
      'genreIds': instance.genreIds,
      'overview': instance.overview,
      'voteAverage': instance.voteAverage,
      'releaseDate': instance.releaseDate,
    };
