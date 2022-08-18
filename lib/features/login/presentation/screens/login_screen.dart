import 'dart:developer';
import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/config/routes/app_routes.dart';
import 'package:cashir/core/secure_storage/secure_storage.dart';
import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/core/utils/assets_manager.dart';
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

  String s = '';
  bool check = true;

  Future<bool> getTokenBool() async {
    s = await SecureStorage.getToken() ?? '';
    if (s.isEmpty) {
      print("empty");
      check = false;
      return false;
    } else {
      print("not empty");
      return true;
    }
  }

  Future init() async {
    if (await getTokenBool() == true) {
      if (s.isNotEmpty) {
        OffersCubit.get(context).token = s;
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, Routes.homeNavigatorRoute);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoadingLoginState) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Form(
                key: LoginCubit.get(context).formKeyLogin,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    SizedBox(
                      height: size.height * 0.55,
                      width: double.infinity,
                      child: Image.asset(
                        ImageAssets.loginImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: size.height * 0.60,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20, bottom: 8),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate(AppStrings.welcomeBackText)
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          letterSpacing: 1,
                                          color: AppColors.black,
                                          fontSize: 35,
                                        ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate(
                                            AppStrings.loginToAccountText)
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          letterSpacing: 1,
                                          color: Colors.grey[600],
                                        ),
                                  ),
                                  const SizedBox(height: 30),
                                  SizedBox(
                                    height: 60,
                                    child: TextFormField(
                                      controller: LoginCubit.get(context)
                                          .emailController,
                                      validator: (value) =>
                                          LoginCubit.get(context)
                                              .emailValidation(value, context),
                                      decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .translate(
                                                      AppStrings.emailAddress)
                                                  .toString(),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 20),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 60,
                                    child: TextFormField(
                                      controller: LoginCubit.get(context)
                                          .passwordController,
                                      validator: (value) =>
                                          LoginCubit.get(context)
                                              .passwordValidation(
                                                  value, context),
                                      decoration: InputDecoration(
                                          hintText: AppLocalizations.of(
                                                  context)!
                                              .translate(AppStrings.password)
                                              .toString(),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 20),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide.none)),
                                      obscureText: true,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const LangSwitch(),
                                  const SizedBox(height: 20),
                                  InkWell(
                                    onTap: () {
                                      var key =
                                          LoginCubit.get(context).formKeyLogin;
                                      if (key.currentState!.validate()) {
                                        LoginCubit.get(context)
                                            .userLogin(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(AppLocalizations
                                                        .of(context)!
                                                    .translate(AppStrings
                                                        .loginResponseSnackbar)
                                                    .toString())));
                                        LoginCubit.get(context)
                                            .emailController
                                            .text = '';
                                        LoginCubit.get(context)
                                            .passwordController
                                            .text = '';
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.amber[800],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .translate(AppStrings.login)
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                  color: AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
