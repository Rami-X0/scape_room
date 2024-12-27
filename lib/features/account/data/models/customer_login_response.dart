import 'package:json_annotation/json_annotation.dart';

part 'customer_login_response.g.dart';

@JsonSerializable()
class CustomerLoginResponse {
  final String token;
  final String userName;
  final String id;

  CustomerLoginResponse({
    required this.token,
    required this.userName,
    required this.id,
  });

  factory CustomerLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerLoginResponseFromJson(json);
}
