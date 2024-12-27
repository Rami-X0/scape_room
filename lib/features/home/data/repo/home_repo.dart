import 'package:scape_room/core/networking/api_error_handller.dart';
import 'package:scape_room/core/networking/api_result.dart';
import 'package:scape_room/core/networking/api_services.dart';
import 'package:scape_room/features/home/data/models/add_booking_request.dart';
import 'package:scape_room/features/home/data/models/add_review_request.dart';
import 'package:scape_room/features/home/data/models/get_all_booking.dart';
import 'package:scape_room/features/home/data/models/get_all_businesses_response.dart';

class HomeRepo {
  final ApiServices _apiServices;

  HomeRepo(this._apiServices);

  Future<ApiResult<List<GetAllBusinessesResponse>>> getAllBusiness() async {
    try {
      final response = await _apiServices.getAllBusiness();
      return ApiResultSuccess(data: response);
    } catch (failure) {
      return ApiResultFailure(failure: ApiErrorHandler.handle(failure));
    }
  }

  Future<ApiResult> addReview(AddReviewRequest body) async {
    try {
      final response = await _apiServices.addReview(body);
      return ApiResultSuccess(data: response);
    } catch (failure) {
      return ApiResultFailure(failure: ApiErrorHandler.handle(failure));
    }
  }

  Future<ApiResult> addBook(AddBookingRequest body) async {
    try {
      final response = await _apiServices.addBook(body);
      return ApiResultSuccess(data: response);
    } catch (failure) {
      return ApiResultFailure(failure: ApiErrorHandler.handle(failure));
    }
  }

  Future<ApiResult<List<GetAllBooking>>> getAllBook(String userId) async {
    try {
      final response = await _apiServices.getAllBooking(userId);
      return ApiResultSuccess(data: response);
    } catch (failure) {
      return ApiResultFailure(failure: ApiErrorHandler.handle(failure));
    }
  }
}
