import 'package:dio/dio.dart';
import 'package:pg_diaco_complaints/core/error/exception.dart';

mixin ErrorHandler {
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
          '''Error occured while Communication with Server with StatusCode : ${response.statusCode}''',
        );
    }
  }
}
