import 'package:cashir/config/routes/app_routes.dart';
import 'package:cashir/core/secure_storage/secure_storage.dart';
import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/core/utils/assets_manager.dart';
import 'package:cashir/core/widgets/lang_switch.dart';
import 'package:cashir/features/logout/presentation/cubit/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/local/app_localizations.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LogoutCubit, LogoutState>(
        builder: (context, state) {
          if (state is LogoutLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LogoutLoadedState) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            });
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(width: MediaQuery.of(context).size.width * 0.22),
                      Image.asset(
                        ImageAssets.logoutVector,
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      LogoutCubit.get(context).userLogout();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)!
                              .translate(AppStrings.logoutResponseSnackbar)
                              .toString())));
                    },
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate(AppStrings.logout)
                          .toString(),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.amber[800],
                            letterSpacing: 2,
                          ),
                    ),
                  ),
                  const SizedBox(height: 200),
                  Spacer(),
                  const LangSwitch(),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
