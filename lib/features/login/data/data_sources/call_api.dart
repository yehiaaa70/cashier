import 'dart:convert';
import 'dart:developer';

import 'package:cashir/config/routes/app_routes.dart';
import 'package:cashir/features/login/data/models/user_model.dart';
import 'package:cashir/features/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/secure_storage/secure_storage.dart';

class CallApi {
  // String token = '';
  late SharedPreferences sharedPreferences;
  late UserModel userModel;
  Future<void> login(String email, String password, context) async {
    try {
      var respose = await http.post(
          Uri.parse('https://itrplanet.com/Kop/public/api/auth/login/cashier'),
          body: ({
            'email': email,
            'password': password,
          }));
      if (respose.statusCode == 200) {
        var tokenValue = json.decode(respose.body)['data']['token'];
        print("tokenValue");
        print(tokenValue);

        print("token");

        SecureStorage.saveToken(tokenValue);
        Navigator.pushReplacementNamed(context, Routes.homeNavigatorRoute);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong')));
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
