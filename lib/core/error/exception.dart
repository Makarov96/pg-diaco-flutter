import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ServerException implements Exception, Equatable {
  ServerException([
    this.message = '',
    this.prefix = '',
  ]);
  final String message;
  final String prefix;
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends ServerException {
  FetchDataException([String message = ''])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends ServerException {
  BadRequestException([String message = ''])
      : super(message, 'Invalid Request:');
}

class UnauthorisedException extends ServerException {
  UnauthorisedException([String message = ''])
      : super(message, 'Unauthorised:');
}

class InvalidInputException extends ServerException {
  InvalidInputException([String message = ''])
      : super(message, 'Invalid Input:');
}

class NetworkException extends ServerException {
  NetworkException([String message = ''])
      : super(message, 'Network Failure Internet Connection:');
}
