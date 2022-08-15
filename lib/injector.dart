import 'package:cashir/features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'package:cashir/features/login/presentation/cubit/login_cubit.dart';
import 'package:cashir/features/logout/presentation/cubit/logout_cubit.dart';
import 'package:cashir/features/offers/presentation/cubit/offers_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/new_orders/presentation/cubit/order_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features
  // Blocs
  serviceLocator.registerFactory(() => HomeNavigatorCubit());
  // serviceLocator.registerFactory(() => TabBarStatusCubit());
  serviceLocator.registerFactory(() => OrderCubit());
  serviceLocator.registerFactory(() => LoginCubit());
  serviceLocator.registerFactory(() => OffersCubit());
  serviceLocator.registerFactory(() => LogoutCubit());

  // Local database sharedpreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
}
