import 'package:json_annotation/json_annotation.dart';

part 'customer_register_request.g.dart';

@JsonSerializable()
class CustomerRegisterRequest {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  CustomerRegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$CustomerRegisterRequestToJson(this);
}
