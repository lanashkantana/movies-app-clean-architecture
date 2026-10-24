// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geners_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenersModel _$GenersModelFromJson(Map<String, dynamic> json) =>
    GenersModel(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$GenersModelToJson(GenersModel instance) =>
    <String, dynamic>{'name': instance.name, 'id': instance.id};
