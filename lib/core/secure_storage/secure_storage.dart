import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // updateToken(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('token', token);
  // }

  static final storage = FlutterSecureStorage();

  static Future saveToken(String tokenValue) async =>
      await storage.write(key: 'token', value: tokenValue);
  static Future saveLanguage(String languageValue) async =>
      await storage.write(key: 'language', value: languageValue);

  static Future<String?> getLanguage() async =>
      await storage.read(key: 'language');
  static Future<String?> getToken() async => await storage.read(key: 'token');
  static Future deleteToken() async => await storage.delete(key: 'token');
}
