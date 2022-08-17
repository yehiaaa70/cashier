import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/secure_storage/secure_storage.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitialState());
  static LogoutCubit get(context) => BlocProvider.of<LogoutCubit>(context);

  userLogout() async {
    emit(LogoutLoadingState());
    await SecureStorage.deleteToken();
    emit(LogoutLoadedState());
  }
}
