import 'dart:developer';

import 'package:cashir/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenInLocalDB {
  final SharedPreferences sharedPreferences;
  TokenInLocalDB({
    required this.sharedPreferences,
  });

  Future<String> getToken() async {
    final token = sharedPreferences.getString(AppStrings.userToken);
    if (token != null) {
      return token;
    } else {
      log('Error in getToken by sharedPref');
    }
    throw Exception();
  }

  Future<void> saveToken(String token) {
    return sharedPreferences.setString(AppStrings.userToken, token);
  }
}
