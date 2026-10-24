import 'package:film_app/movies/domain/entities/geners.dart';

class GenersModel extends Geners {
  const GenersModel({required super.name, required super.id});

  factory GenersModel.fromJson(Map<String, dynamic> json) {
    return GenersModel(
      id: json['id'],
     name: json['name'],
    );
  }
}
