// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerRegisterRequest _$CustomerRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    CustomerRegisterRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$CustomerRegisterRequestToJson(
        CustomerRegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
    };
