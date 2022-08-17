import 'dart:developer';

import 'package:cashir/features/history/presentation/cubit/history_cubit.dart';
import 'package:cashir/features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'package:cashir/features/home_navigator/presentation/screens/home_navigator_screen.dart';
import 'package:cashir/features/language/presentation/bloc/language_bloc.dart';

import 'package:cashir/features/login/presentation/cubit/login_cubit.dart';
import 'package:cashir/features/login/presentation/screens/login_screen.dart';
import 'package:cashir/features/logout/presentation/cubit/logout_cubit.dart';
import 'package:cashir/features/offers/presentation/cubit/offers_cubit.dart';
import 'package:cashir/features/order_progress/presentation/cubit/progress_cubit.dart';
import 'package:cashir/features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cashir/features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
import 'package:cashir/features/order_status_tabbars/presentation/screens/orders_status_tabbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/local/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/new_orders/presentation/cubit/acceptor_cubit.dart';
import 'features/notifications/presentation/cubit/notification_cubit.dart';
import 'features/splash/presentation/pages/splash_screen.dart';
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
        BlocProvider(
          create: (_) => serviceLocator<TabBarStatusCubit>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<AcceptorCubit>(),
        ),
        BlocProvider<OffersCubit>(
          create: (_) => serviceLocator<OffersCubit>(),
        ),
        BlocProvider<LogoutCubit>(
          create: (_) => serviceLocator<LogoutCubit>(),
        ),
        BlocProvider<LanguageBloc>(
          create: (_) => serviceLocator<LanguageBloc>(),
        ),
        BlocProvider<HistoryCubit>(
          create: (_) => serviceLocator<HistoryCubit>(),
        ),

        BlocProvider<NotificationCubit>(
          create: (_) => serviceLocator<NotificationCubit>(),
        ),


      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            locale: state.locale,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
