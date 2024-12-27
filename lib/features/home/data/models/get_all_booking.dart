import 'package:json_annotation/json_annotation.dart';
part 'get_all_booking.g.dart';
@JsonSerializable()
class GetAllBooking {
  final String bookingName;
  final String date;

  GetAllBooking({
    required this.bookingName,
    required this.date,
  });
factory GetAllBooking.fromJson(Map<String, dynamic> json) => _$GetAllBookingFromJson(json);
}
