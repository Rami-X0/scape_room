// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerLoginResponse _$CustomerLoginResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerLoginResponse(
      token: json['token'] as String,
      userName: json['userName'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$CustomerLoginResponseToJson(
        CustomerLoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userName': instance.userName,
      'id': instance.id,
    };
