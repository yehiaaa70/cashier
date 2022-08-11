import 'package:cashir/config/network/network_info.dart';
import 'package:cashir/features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'package:cashir/features/login/data/data_sources/base_login_use_case.dart';
import 'package:cashir/features/login/presentation/cubit/login_cubit.dart';
import 'package:cashir/features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
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

  // Local database sharedpreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
}
