import 'package:cashir/features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'package:cashir/features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/new_orders/presentation/cubit/order_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features
  // Blocs
  serviceLocator.registerFactory(() => HomeNavigatorCubit());
  // serviceLocator.registerFactory(() => TabBarStatusCubit());
  serviceLocator.registerFactory(() => OrderCubit());
}
