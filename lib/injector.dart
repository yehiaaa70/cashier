import 'package:cashir/features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'package:cashir/features/login/presentation/cubit/login_cubit.dart';
import 'package:cashir/features/logout/presentation/cubit/logout_cubit.dart';
import 'package:cashir/features/offers/presentation/cubit/offers_cubit.dart';

import 'package:cashir/core/network/network_info.dart';
import 'package:cashir/features/home_navigator/data/data_sources/all_orders_data_sources.dart';
import 'package:cashir/features/home_navigator/data/repositories/order_data_repo.dart';
import 'package:cashir/features/home_navigator/domain/repositories/base_orders_repositories.dart';
import 'package:cashir/features/home_navigator/domain/use_cases/get_all_order_use_case.dart';
import 'package:cashir/features/login/presentation/cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'features/new_orders/data/data_sources/accept_order_data_source.dart';
import 'features/new_orders/data/repositories/accept_order_data_repo.dart';
import 'features/new_orders/domain/repositories/base_accept_repositories.dart';
import 'features/new_orders/domain/use_cases/accept_order_use_case.dart';
import 'features/new_orders/presentation/cubit/acceptor_cubit.dart';
import 'features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features
  // Blocs
  serviceLocator.registerFactory(() => HomeNavigatorCubit(serviceLocator()));
  serviceLocator.registerFactory(() => TabBarStatusCubit(serviceLocator()));
  serviceLocator
      .registerFactory(() => AcceptorCubit(serviceLocator(), serviceLocator()));

  // Use Cases
  serviceLocator.registerLazySingleton(
      () => GetCustomerOrderUseCase(orderRepository: serviceLocator()));

  serviceLocator
      .registerLazySingleton(() => AcceptOrdersUseCase(serviceLocator()));

  // Data Sources
  serviceLocator.registerLazySingleton<AllOrdersRemoteDataSource>(
      () => AllOrdersRemoteDataSource(apiConsumer: serviceLocator()));
  serviceLocator.registerLazySingleton<AcceptOrderRemoteDataSource>(
      () => AcceptOrderRemoteDataSource(serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<BaseOrderRepository>(
    () => OrdersDataRepo(
      networkInfo: serviceLocator(),
      allOrdersRemoteDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<BaseAcceptRepository>(
    () => AcceptOrderDataRepo(
        acceptOrderRemoteDataSource: serviceLocator(),
        networkInfo: serviceLocator()),
  );

  // Data Sources
  serviceLocator.registerLazySingleton<BaseAllOrdersRemoteDataSource>(
      () => AllOrdersRemoteDataSource(apiConsumer: serviceLocator()));

  serviceLocator.registerLazySingleton<BaseAcceptOrderRemoteDataSource>(
      () => AcceptOrderRemoteDataSource(serviceLocator()));

  //! Core
  //Network
  serviceLocator.registerLazySingleton<BaseNetworkInfo>(
          () => NetworkInfo(connectionChecker: serviceLocator()));

  // Api Consumer
  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));

// Dio
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => AppInterceptors());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );

  // Internet Connection Checker
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
  // serviceLocator.registerFactory(() => TabBarStatusCubit());
  serviceLocator.registerFactory(() => LoginCubit());
  serviceLocator.registerFactory(() => OffersCubit());
  serviceLocator.registerFactory(() => LogoutCubit());

  // Local database sharedpreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
}
