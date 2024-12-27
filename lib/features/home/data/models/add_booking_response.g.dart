// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBookingResponse _$AddBookingResponseFromJson(Map<String, dynamic> json) =>
    AddBookingResponse(
      bookingName: json['bookingName'] as String,
      qrCode: json['qrCode'] as String,
    );

Map<String, dynamic> _$AddBookingResponseToJson(AddBookingResponse instance) =>
    <String, dynamic>{
      'bookingName': instance.bookingName,
      'qrCode': instance.qrCode,
    };
