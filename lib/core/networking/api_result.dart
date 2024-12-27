import 'package:scape_room/core/networking/api_error_model.dart';

abstract class ApiResult<T> {
  R when<R>(
      {required R Function(T data) success,
        required R Function(ApiErrorModel error) failure});
}

class ApiResultSuccess<T> extends ApiResult<T> {
  final T data;

  ApiResultSuccess({required this.data});

  @override
  R when<R>(
      {required R Function(T data) success,
        required R Function(ApiErrorModel error) failure}) {
    return success(data);
  }
}

class ApiResultFailure<T> extends ApiResult<T> {
  final ApiErrorModel failure;

  ApiResultFailure({required this.failure});

  @override
  R when<R>(
      {required R Function(T data) success,
        required R Function(ApiErrorModel error) failure}) {
    return failure(this.failure);
  }
}
