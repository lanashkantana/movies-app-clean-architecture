import 'package:film_app/core/network/error_message_model.dart';

class ServerExceptions implements Exception {
  final ErrorMessageModel message;

  const ServerExceptions({required this.message});
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({required this.message});
}
