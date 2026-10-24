import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;
  final int statusCode;
  final bool success;

  const ErrorMessageModel(this.success, {required this.statusCode, required this.statusMessage});
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      json['success'] ?? false,
      statusCode: json['status_code'] ?? 0,
      statusMessage: json['status_message'] ?? '',
    );
  }

  @override
  List<Object?> get props => [success, statusCode, statusMessage];





}
