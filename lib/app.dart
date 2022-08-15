import 'dart:developer';

import 'package:cashir/features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'package:cashir/features/login/presentation/cubit/login_cubit.dart';
import 'package:cashir/features/logout/presentation/cubit/logout_cubit.dart';
import 'package:cashir/features/new_orders/presentation/cubit/order_cubit.dart';
import 'package:cashir/features/offers/presentation/cubit/offers_cubit.dart';
import 'package:cashir/features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/local/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'injector.dart';

class CashirApp extends StatelessWidget {
  const CashirApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<HomeNavigatorCubit>(),
        ),
        BlocProvider<LoginCubit>(
          create: (_) => serviceLocator<LoginCubit>(),
        ),

        // BlocProvider(
        //   create: (_) => serviceLocator<TabBarStatusCubit>(),
        // ),
        BlocProvider(
          create: (_) => serviceLocator<OrderCubit>(),
        ),
        BlocProvider<OffersCubit>(
          create: (_) => serviceLocator<OffersCubit>(),
        ),
        BlocProvider<LogoutCubit>(
          create: (_) => serviceLocator<LogoutCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        // locale: state.locale,
        theme: appTheme(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localeResolutionCallback:
            AppLocalizationsSetup.localeResolutionCallback,
        localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      ),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: AppStrings.appName,
    //   // locale: state.locale,
    //   theme: appTheme(),
    //   onGenerateRoute: AppRoutes.onGenerateRoute,
    //   supportedLocales: AppLocalizationsSetup.supportedLocales,
    //   localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
    //   localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
    // );
  }
}
