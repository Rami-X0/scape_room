// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerLoginRequest _$CustomerLoginRequestFromJson(
        Map<String, dynamic> json) =>
    CustomerLoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$CustomerLoginRequestToJson(
        CustomerLoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
