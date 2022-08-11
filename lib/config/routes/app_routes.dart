import 'package:cashir/features/locale/presentation/screens/locale_screen.dart';
import 'package:cashir/features/login/presentation/screens/login_screen.dart';
import 'package:cashir/features/notifications/presentation/screens/notification_screen.dart';
import 'package:cashir/features/offers/presentation/screens/offers_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/home_navigator/presentation/screens/home_navigator_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/loginRoute';
  static const String homeNavigatorRoute = '/homeNavigatorRoute';
  static const String offersRoute = '/offersRoute';
  static const String notificationRoute = '/notificationRoute';
  static const String localeRoute = '/localeRoute';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
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
