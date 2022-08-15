import 'package:cashir/config/routes/app_routes.dart';
import 'package:cashir/core/secure_storage/secure_storage.dart';
import 'package:cashir/features/login/data/data_sources/call_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? emailValidation(String? value) {
    return RegExp(
                r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value!)
        ? null
        : 'Please provide a valid email';
  }

  String? passwordValidation(String? value) {
    return value!.isNotEmpty ? null : 'Please provide password';
  }

  userLogin(context) async {
    emit(LoadingLoginState());
    await CallApi()
        .login(emailController.text, passwordController.text, context);

    emit(LoadedLoginState());
  }
}
