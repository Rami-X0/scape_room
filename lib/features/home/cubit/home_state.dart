import 'package:scape_room/core/networking/api_error_model.dart';
import 'package:scape_room/features/home/data/models/add_booking_response.dart';
import 'package:scape_room/features/home/data/models/get_all_booking.dart';
import 'package:scape_room/features/home/data/models/get_all_businesses_response.dart';

class HomeInitialState {}

class GetAllBusinessLoadingState extends HomeInitialState {}

class GetAllBusinessSuccessState extends HomeInitialState {
  final List<GetAllBusinessesResponse> data;

  GetAllBusinessSuccessState(this.data);
}

class GetAllBusinessFailureState extends HomeInitialState {
  final ApiErrorModel failure;

  GetAllBusinessFailureState(this.failure);
}

class AddReviewLoadingState extends HomeInitialState {}

class AddReviewSuccessState extends HomeInitialState {}

class AddReviewFailureState extends HomeInitialState {
  final ApiErrorModel failure;

  AddReviewFailureState(this.failure);
}

class AddReviewRateState extends HomeInitialState {
  final int rate;

  AddReviewRateState({required this.rate});
}

class AddBookingLoadingState extends HomeInitialState {}

class AddBookingSuccessState extends HomeInitialState {
  final AddBookingResponse data;

  AddBookingSuccessState({required this.data});
}

class AddBookingFailureState extends HomeInitialState {
  final ApiErrorModel failure;

  AddBookingFailureState(this.failure);
}

class GetAllBookingLoadingState extends HomeInitialState {}

class GetAllBookingSuccessState extends HomeInitialState {
  final List<GetAllBooking> data;

  GetAllBookingSuccessState({required this.data});
}

class GetAllBookingFailureState extends HomeInitialState {
  final ApiErrorModel failure;

  GetAllBookingFailureState(this.failure);
}
