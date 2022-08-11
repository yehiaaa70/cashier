import 'package:cashir/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bloc_observer.dart';
import 'app.dart';
import 'injector.dart' as injector;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.setup();
  BlocOverrides.runZoned(
    () => runApp(const CashirApp()),
    blocObserver: AppBlocObserver(),
  );
}
