import 'package:cashir/features/add_offer/presentation/screens/add_offer_screen.dart';
import 'package:cashir/features/locale/presentation/screens/locale_screen.dart';
import 'package:cashir/features/login/presentation/screens/login_screen.dart';
import 'package:cashir/features/notifications/presentation/screens/notification_screen.dart';
import 'package:cashir/features/offers/presentation/screens/offers_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/home_navigator/presentation/screens/home_navigator_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/loginRoute';
  static const String homeNavigatorRoute = '/homeNavigatorRoute';
  static const String offersRoute = '/offersRoute';
  static const String addOffersRoute = '/addOffersRoute';
  static const String notificationRoute = '/notificationRoute';
  static const String localeRoute = '/localeRoute';
  static const String logoutRoute = '/logoutRoute';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.homeNavigatorRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeNavigatorScreen(),
        );
      case Routes.offersRoute:
        return MaterialPageRoute(
          builder: (context) => const OffersScreen(),
        );
      case Routes.notificationRoute:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );
      case Routes.localeRoute:
        return MaterialPageRoute(
          builder: (context) => const LocaleScreen(),
        );
      case Routes.addOffersRoute:
        return MaterialPageRoute(
          builder: (context) => const AddOfferScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
