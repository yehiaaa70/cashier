import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  static const storage =  FlutterSecureStorage();

  static Future saveToken(String tokenValue) async =>
      await storage.write(key: 'token', value: tokenValue);

  static Future<String?> getToken() async => await storage.read(key: 'token');
  static Future deleteToken() async => await storage.delete(key: 'token');
}
