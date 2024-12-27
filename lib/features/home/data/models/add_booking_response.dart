import 'package:json_annotation/json_annotation.dart';

part 'add_booking_response.g.dart';

@JsonSerializable()
class AddBookingResponse {
  final String bookingName;
  final String qrCode;

  AddBookingResponse({
    required this.bookingName,
    required this.qrCode,
  });

factory AddBookingResponse.fromJson(Map<String, dynamic> json) => _$AddBookingResponseFromJson(json);
}
