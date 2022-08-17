import 'package:cashir/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/secure_storage/secure_storage.dart';
import '../../../../core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  String? s;

  Future<bool> getTokenBool() async {
    s = await SecureStorage.getToken();
    if (s==null||s=='') {
      return false;
    } else {
      return true;
    }
  }

  Future init() async {
    if (await getTokenBool() == true) {
        print("ssss :");
        print(s);
        Navigator.pushReplacementNamed(context, Routes.homeNavigatorRoute);
    }else {
      print("logiiiiiiiiiiiiiiiiiiiin :");
      print(s);
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
