import 'package:scape_room/core/networking/api_error_handller.dart';
import 'package:scape_room/core/networking/api_result.dart';
import 'package:scape_room/core/networking/api_services.dart';
import 'package:scape_room/features/account/data/models/customer_login_request.dart';
import 'package:scape_room/features/account/data/models/customer_login_response.dart';
import 'package:scape_room/features/account/data/models/customer_register_request.dart';

class CustomerLoginRepo {
  final ApiServices _apiServices;

  CustomerLoginRepo(this._apiServices);

  Future <ApiResult<CustomerLoginResponse>> customerLogin(
      {required CustomerLoginRequest body}) async {
    try {
      final request = await _apiServices.customerLogin(body);
      return ApiResultSuccess(data: request);
    } catch (failure) {
      return ApiResultFailure(failure: ApiErrorHandler.handle(failure));
    }
  }
}
