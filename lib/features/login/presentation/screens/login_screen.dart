import 'dart:developer';
import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/config/routes/app_routes.dart';
import 'package:cashir/core/secure_storage/secure_storage.dart';
import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/core/widgets/lang_switch.dart';
import 'package:cashir/features/login/presentation/cubit/login_cubit.dart';
import 'package:cashir/features/offers/presentation/cubit/offers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  String? s;

  Future<bool> getTokenBool() async {
    s = await SecureStorage.getToken();
    if (s!.isEmpty) {
      print("empty");
      return false;
    } else {
      print("not empty");
      return true;
    }
  }

  Future init() async {

    OffersCubit.get(context).token = (await SecureStorage.getToken())!;
    // log(userToken.toString());
    if (OffersCubit.get(context).token.length > 800) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, Routes.homeNavigatorRoute);
      });

    if (await getTokenBool() == true) {
      if (s!.isNotEmpty) {
        Navigator.pushReplacementNamed(context, Routes.homeNavigatorRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.homeNavigatorRoute);
      }

    }
    //
    // LoginCubit.get(context).getTokenBool();
    // // log(userToken.toString());
    // if (OffersCubit.get(context).token.length > 800) {
    //   SchedulerBinding.instance.addPostFrameCallback((_) {
    //     Navigator.pushReplacementNamed(context, Routes.homeNavigatorRoute);
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoadingLoginState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Form(
            key: LoginCubit.get(context).formKeyLogin,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                const SizedBox(height: 50),
                const LangSwitch(),
                Center(
                    child: Text(
                  AppLocalizations.of(context)!
                      .translate(AppStrings.appName)
                      .toString(),
                  style: Theme.of(context).textTheme.headline3,
                )),
                const SizedBox(height: 30),
                Text(
                  AppLocalizations.of(context)!
                      .translate(AppStrings.emailAddress)
                      .toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: LoginCubit.get(context).emailController,
                  validator: (value) =>
                      LoginCubit.get(context).emailValidation(value, context),
                  decoration: InputDecoration(
                      fillColor: AppColors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none)),
                ),
                const SizedBox(height: 30),
                Text(
                  AppLocalizations.of(context)!
                      .translate(AppStrings.password)
                      .toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: LoginCubit.get(context).passwordController,
                  validator: (value) => LoginCubit.get(context)
                      .passwordValidation(value, context),
                  decoration: InputDecoration(
                      fillColor: AppColors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none)),
                  obscureText: true,
                ),
                const SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    var key = LoginCubit.get(context).formKeyLogin;
                    if (key.currentState!.validate()) {
                      LoginCubit.get(context).userLogin(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)!
                              .translate(AppStrings.loginResponseSnackbar)
                              .toString())));
                      LoginCubit.get(context).emailController.text = '';
                      LoginCubit.get(context).passwordController.text = '';
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate(AppStrings.login)
                            .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
