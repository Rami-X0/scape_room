import 'package:json_annotation/json_annotation.dart';
part 'add_booking_request.g.dart';
@JsonSerializable()
class AddBookingRequest {
  final String bookingName;
  final String date;
  final String roomId;
  final int numberOfPlayers;
  final String userId;

  AddBookingRequest({
    required this.bookingName,
    required this.date,
    required this.roomId,
    required this.numberOfPlayers,
    required this.userId,
  });
Map<String, dynamic> toJson() => _$AddBookingRequestToJson(this);
}
