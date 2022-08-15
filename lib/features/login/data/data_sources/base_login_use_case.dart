import 'dart:convert';
import 'dart:developer';

import 'package:cashir/features/login/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseLoginDataSource {
  Future<UserModel> login();
}

class LoginDataSource implements BaseLoginDataSource {
  @override
  Future<UserModel> login() async {
    var headers = {
      'Cookie': 'kop_session=KoDql5xNoKl5HbwTR4S7xEUjIdM59JGh1kZkIXMc'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('https://itrplanet.com/Kop/public/api/auth/login/cashier'));
    request.fields
        .addAll({'email': 'cashier@212.net', 'password': '123456789'});

    request.headers.addAll(headers);

    http.StreamedResponse response1 = await request.send();
    var response = await http.Response.fromStream(response1);

    if (response.statusCode == 200) {
      log(json.decode(response.body));
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }
}
