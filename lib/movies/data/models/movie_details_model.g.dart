// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      genres: const GenersConverter().fromJson(json['genres'] as List),
      backDropPath: json['back_drop_path'] as String,
      id: (json['id'] as num).toInt(),
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      runtime: (json['runtime'] as num).toInt(),
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );
