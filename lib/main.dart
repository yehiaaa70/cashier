import 'package:cashir/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'app_bloc_observer.dart';
import 'app.dart';
import 'injector.dart' as injector;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await injector.setup();
  BlocOverrides.runZoned(
    () => runApp(const CashirApp()),
    blocObserver: AppBlocObserver(),
  );
}
