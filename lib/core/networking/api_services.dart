import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:scape_room/core/networking/api_constants.dart';
import 'package:scape_room/features/account/data/models/customer_login_request.dart';
import 'package:scape_room/features/account/data/models/customer_login_response.dart';
import 'package:scape_room/features/account/data/models/customer_register_request.dart';
import 'package:scape_room/features/home/data/models/add_booking_request.dart';
import 'package:scape_room/features/home/data/models/add_booking_response.dart';
import 'package:scape_room/features/home/data/models/add_review_request.dart';
import 'package:scape_room/features/home/data/models/get_all_booking.dart';
import 'package:scape_room/features/home/data/models/get_all_businesses_response.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiConstants.customerRegister)
  Future customerCreateAccount(@Body() CustomerRegisterRequest body);

  @POST(ApiConstants.login)
  Future<CustomerLoginResponse> customerLogin(
      @Body() CustomerLoginRequest body);

  @GET(ApiConstants.getAllBusiness)
  Future<List<GetAllBusinessesResponse>> getAllBusiness();

  @POST(ApiConstants.addReview)
  Future addReview(@Body() AddReviewRequest body);

  @POST(ApiConstants.addBooking)
  Future<AddBookingResponse> addBook(@Body() AddBookingRequest body);

  @GET('${ApiConstants.getBooking}/{userId}')
  Future<List<GetAllBooking>> getAllBooking(@Path('userId') String userId);


}
