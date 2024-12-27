// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBookingRequest _$AddBookingRequestFromJson(Map<String, dynamic> json) =>
    AddBookingRequest(
      bookingName: json['bookingName'] as String,
      date: json['date'] as String,
      roomId: json['roomId'] as String,
      numberOfPlayers: (json['numberOfPlayers'] as num).toInt(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$AddBookingRequestToJson(AddBookingRequest instance) =>
    <String, dynamic>{
      'bookingName': instance.bookingName,
      'date': instance.date,
      'roomId': instance.roomId,
      'numberOfPlayers': instance.numberOfPlayers,
      'userId': instance.userId,
    };
