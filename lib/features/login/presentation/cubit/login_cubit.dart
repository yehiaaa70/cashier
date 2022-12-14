import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/core/secure_storage/secure_storage.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/features/login/data/data_sources/call_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? token;

  String? s;
  String currentLanguageCode = AppStrings.englishCode;

  Future<bool> getTokenBool() async {
    s = await SecureStorage.getToken();
    if (s!.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  String? emailValidation(String? value, context) {
    return RegExp(
                r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value!)
        ? null
        : AppLocalizations.of(context)!
            .translate(AppStrings.emailValidationText);
  }

  String? passwordValidation(String? value, context) {
    return value!.isNotEmpty
        ? null
        : AppLocalizations.of(context)!
            .translate(AppStrings.passwordValidationText);
  }

  userLogin(context) async {
    emit(LoadingLoginState());
    await CallApi()
        .login(emailController.text, passwordController.text, context);

    emit(AuthStateAuthenticated());
    emit(LoadedLoginState());
  }

  getToken() async {
    emit(GetTokenLoading());
    if (await SecureStorage.getToken() != null) {
      emit(GetTokenLoaded());
    } else {
      emit(GetTokenEmpty());
    }
  }
}
