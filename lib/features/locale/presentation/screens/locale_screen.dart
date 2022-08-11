import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class LocaleScreen extends StatelessWidget {
  const LocaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Please choose language",
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("English", style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 10),
                Radio(value: true, groupValue: true, onChanged: (value) {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("العربيه", style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 10),
                Radio(value: false, groupValue: true, onChanged: (value) {}),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.homeNavigatorRoute);
              },
              child: Container(
                width: 140,
                height: 35,
                decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(AppStrings.go,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.white))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
