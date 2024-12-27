import 'package:json_annotation/json_annotation.dart';

part 'customer_login_request.g.dart';

@JsonSerializable()
class CustomerLoginRequest {
  final String email;
  final String password;

  CustomerLoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$CustomerLoginRequestToJson(this);
}
