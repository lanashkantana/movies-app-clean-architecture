// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      backDropPath: json['back_drop_path'] as String,
      id: (json['id'] as num).toInt(),
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      runtime: (json['runtime'] as num).toInt(),
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'back_drop_path': instance.backDropPath,
      'id': instance.id,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'genres': instance.genres,
    };
