import 'package:scape_room/core/networking/api_error_handller.dart';
import 'package:scape_room/core/networking/api_result.dart';
import 'package:scape_room/core/networking/api_services.dart';
import 'package:scape_room/features/account/data/models/customer_register_request.dart';

class CustomerCreateAccountRepo {
  final ApiServices _apiServices;

  CustomerCreateAccountRepo(this._apiServices);

  Future<ApiResult> customerCreateAccount(
      {required CustomerRegisterRequest body}) async {
    try {
      final request = await _apiServices.customerCreateAccount(body);
      return ApiResultSuccess(data: request);
    } catch (failure) {
      return ApiResultFailure(failure: ApiErrorHandler.handle(failure));
    }
  }
}
