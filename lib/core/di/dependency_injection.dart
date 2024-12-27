import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:scape_room/core/networking/api_factory.dart';
import 'package:scape_room/core/networking/api_services.dart';
import 'package:scape_room/features/account/cubit/account_cubit.dart';
import 'package:scape_room/features/account/data/repo/customer_create_account_repo.dart';
import 'package:scape_room/features/account/data/repo/customer_login_repo.dart';
import 'package:scape_room/features/home/cubit/home_cubit.dart';
import 'package:scape_room/features/home/data/repo/home_repo.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  Dio dio = await DioFactory.getDio();
// account
  getIt.registerLazySingleton<AccountCubit>(() => AccountCubit(getIt(),getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<CustomerCreateAccountRepo>(() => CustomerCreateAccountRepo(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<CustomerLoginRepo>(() => CustomerLoginRepo(getIt()));
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));
}
