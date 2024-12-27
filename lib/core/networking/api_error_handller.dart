import 'package:dio/dio.dart';
import 'package:scape_room/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          print('errrrror${_handlerError(error.response?.data)}');
          return _handlerError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Unexpected error occurred");
    }
  }

  static ApiErrorModel _handlerError(dynamic message) {
    if (message is List) {
      String aggregatedMessages = message.map((error) {
        return "${error['code']}: \n${error['description']}".replaceAll('.',' ');
      }).join(' \n');
      return ApiErrorModel(message: aggregatedMessages);
    }
if(message is String){
  return ApiErrorModel(message: message);
}
    return ApiErrorModel(message: message['description']);
  }
}
