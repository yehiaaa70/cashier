import 'package:cashir/config/routes/app_routes.dart';
import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/core/utils/assets_manager.dart';
import 'package:cashir/features/logout/presentation/cubit/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.27),
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('You have logged out successfully')));
                  },
                  child: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: AppColors.blue,
                          letterSpacing: 2,
                        ),
                  ),
                ),
                const SizedBox(height: 200),
              ],
            ),
          );
        },
      ),
    );
  }
}
