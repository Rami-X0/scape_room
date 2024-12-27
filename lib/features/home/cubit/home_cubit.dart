import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scape_room/core/caching/app_shared_pref.dart';
import 'package:scape_room/core/caching/app_shared_pref_key.dart';
import 'package:scape_room/features/home/cubit/home_state.dart';
import 'package:scape_room/features/home/data/models/add_booking_request.dart';
import 'package:scape_room/features/home/data/models/add_review_request.dart';
import 'package:scape_room/features/home/data/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeInitialState> {
  final HomeRepo _homeRepo;
  int rate = 1;
  String? businessId;
  String? roomId;
  String? bookingName;
  String? date;
  int? numberOfPlayers;

  HomeCubit(this._homeRepo) : super(HomeInitialState());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final TextEditingController commentController =
      TextEditingController();

  void addRate(int rate) {
    this.rate = rate;
    emit(AddReviewRateState(rate: rate));
  }

  void getAllBusinesses() async {
    emit(GetAllBusinessLoadingState());
    final response = await _homeRepo.getAllBusiness();
    response.when(success: (data) async{
      userId =await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.userId);
      userName =await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.userName);
      emit(GetAllBusinessSuccessState(data));
    }, failure: (failure) {
      emit(GetAllBusinessFailureState(failure));
    });
  }

  Future<void> addReview() async {
    emit(AddReviewLoadingState());
    final response = await _homeRepo.addReview(
      AddReviewRequest(
        rating: rate,
        comment: commentController.text,
        businessId: businessId!,
        roomId: roomId!,
        userId: userId,
        userName: userName,
      ),
    );
    response.when(success: (data) {
      getAllBusinesses();
      emit(AddReviewSuccessState());
    }, failure: (failure) {
      emit(AddReviewFailureState(failure));
    });
  }

  Future<void> addBooking() async {
    emit(AddBookingLoadingState());
    final request = await _homeRepo.addBook(
      AddBookingRequest(
        numberOfPlayers: numberOfPlayers!,
        bookingName: bookingName!,
        date: date!,
        roomId: roomId!,
        userId: userId,
      ),
    );
    request.when(success: (data) {
      emit(AddBookingSuccessState(data: data));
    }, failure: (failure) {
      emit(AddBookingFailureState(failure));
    });
  }

  Future<void> getAllBooking() async {
    emit(GetAllBookingLoadingState());
    final request = await _homeRepo.getAllBook(userId);
    request.when(success: (data) {
      getAllBusinesses();
      emit(GetAllBookingSuccessState(data: data));
    }, failure: (failure) {
      emit(GetAllBookingFailureState(failure));
    });
  }
}
