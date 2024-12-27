import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scape_room/core/caching/app_shared_pref.dart';
import 'package:scape_room/core/caching/app_shared_pref_key.dart';
import 'package:scape_room/features/account/cubit/account_state.dart';
import 'package:scape_room/features/account/data/models/customer_login_request.dart';
import 'package:scape_room/features/account/data/models/customer_register_request.dart';
import 'package:scape_room/features/account/data/repo/customer_create_account_repo.dart';
import 'package:scape_room/features/account/data/repo/customer_login_repo.dart';

class AccountCubit extends Cubit<AccountInitialState> {
  final CustomerCreateAccountRepo _customerRegisterRepo;
  final CustomerLoginRepo _customerLoginRepo;

  AccountCubit(this._customerRegisterRepo, this._customerLoginRepo)
      : super(AccountInitialState());
  static bool isLogin = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();

  Future<void> customerCreateAccount() async {
    emit(CustomerCreateAccountLoadingState());

    final request = await _customerRegisterRepo.customerCreateAccount(
        body: CustomerRegisterRequest(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: phoneNumberController.text,
    ));
    request.when(success: (data) {
      emit(CustomerCreateAccountSuccessState());
    }, failure: (failure) {
      emit(CustomerCreateAccountFailureState(failure));
    });
  }

 Future <void> customerLogin() async {
    emit(CustomerLoginLoadingState());
    final request = await _customerLoginRepo.customerLogin(
        body: CustomerLoginRequest(
      email: emailController.text,
      password: passwordController.text,
    ));
    request.when(success: (data) async {
      await saveToken(data.token);
      await saveUserName(data.userName);
      await saveUserId(data.id);
      emit(CustomerLoginSuccessState(data: data));
    }, failure: (failure) {
      emit(CustomerLoginFailureState(failure.toString()));
    });
  }

  Future<void> saveToken(String token) async {
    await AppSharedPref.sharedPrefSet(
        key: AppSharedPrefKey.token, value: token);
  }

  Future<void> saveUserName(String userName) async {
    await AppSharedPref.sharedPrefSet(
        key: AppSharedPrefKey.userName, value: userName);
  }

  Future<void> saveUserId(String userId) async {
    await AppSharedPref.sharedPrefSet(
        key: AppSharedPrefKey.userId, value: userId);
  }
}
