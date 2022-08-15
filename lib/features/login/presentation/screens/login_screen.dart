import 'dart:developer';

import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/features/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                const SizedBox(height: 80),
                Center(
                    child: Text(
                  AppStrings.login,
                  style: Theme.of(context).textTheme.headline3,
                )),
                const SizedBox(height: 30),
                Text(
                  AppStrings.emailAddress,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: LoginCubit.get(context).emailController,
                  validator: (value) =>
                      LoginCubit.get(context).emailValidation(value),
                  decoration: InputDecoration(
                      fillColor: AppColors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none)),
                ),
                const SizedBox(height: 30),
                Text(
                  AppStrings.password,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: LoginCubit.get(context).passwordController,
                  validator: (value) =>
                      LoginCubit.get(context).passwordValidation(value),
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
                        AppStrings.login,
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
