import 'package:dio/dio.dart';

class LocalException implements Exception {
  final String errMesssage;

  LocalException(this.errMesssage);
}

class ServerException implements Exception {
  ServerException(this.errMessage);

  final String errMessage;

  factory ServerException.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerException('Connection time out with Api sever !');
      case DioExceptionType.sendTimeout:
        return ServerException('Send time out with Api Server !');
      case DioExceptionType.receiveTimeout:
        return ServerException('Received time out with Api Server !');
      case DioExceptionType.badCertificate:
        return ServerException('Bad Certificate');
      case DioExceptionType.cancel:
        return ServerException('Request for Api is Canceled !');
      case DioExceptionType.badResponse:
        ServerException.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.connectionError:
        return ServerException('Please check your internet connection !');
      case DioExceptionType.unknown:
        return ServerException(
            'Oops , there was an error , please try again later');
    }
    return ServerException(
        'Oops , there was an error , please try again later');
  }

  factory ServerException.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerException(response['error_message']);
    } else if (statusCode == 404) {
      return ServerException('Your request not found , please try again later');
    } else if (statusCode == 500) {
      return ServerException('Internal Server Error , please try again later');
    } else {
      return ServerException(
          'Oops , there was an error , please try again later');
    }
  }
}
