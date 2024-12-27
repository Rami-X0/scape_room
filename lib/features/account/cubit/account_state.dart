import 'package:scape_room/core/networking/api_error_model.dart';
import 'package:scape_room/features/account/data/models/customer_login_response.dart';

class AccountInitialState {}

class CustomerCreateAccountLoadingState extends AccountInitialState {}

class CustomerCreateAccountSuccessState extends AccountInitialState {}

class CustomerCreateAccountFailureState extends AccountInitialState {
  final ApiErrorModel failure;

  CustomerCreateAccountFailureState(this.failure);
}
class CustomerLoginLoadingState extends AccountInitialState {}

class CustomerLoginSuccessState extends AccountInitialState {
  final CustomerLoginResponse data;

  CustomerLoginSuccessState({required this.data});
}

class CustomerLoginFailureState extends AccountInitialState {
  final String failure;

  CustomerLoginFailureState(this.failure);
}
