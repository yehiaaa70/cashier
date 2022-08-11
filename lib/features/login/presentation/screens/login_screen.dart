import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
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
              decoration: InputDecoration(
                  fillColor: AppColors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
              onSaved: (value) {},
            ),
            const SizedBox(height: 30),
            Text(
              AppStrings.password,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  fillColor: AppColors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
              obscureText: true,
              onSaved: (value) {},
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.homeNavigatorRoute);
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
      ),
    );
  }
}
