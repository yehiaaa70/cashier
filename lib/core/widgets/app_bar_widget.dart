import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes/app_routes.dart';
import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key, required this.currentTab}) : super(key: key);
  final int currentTab;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: appBarTitle(context),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 12),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.notificationRoute);
            },
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.darkBlue,
                  size: 35,
                ),
                Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.darkPurple),
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget appBarTitle(context) {
    if (currentTab == 3) {
      return Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                AppLocalizations.of(context)!
                    .translate(AppStrings.offers)
                    .toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: AppColors.darkBlue),
              ),
            ),
          ],
        ),
      );
    } else if (currentTab == 0) {
      return Text(
        AppLocalizations.of(context)!.translate(AppStrings.history).toString(),
        style: Theme.of(context)
            .textTheme
            .headline1
            ?.copyWith(color: AppColors.darkBlue),
      );
    } else if (currentTab == 1) {
      return Text(
        AppLocalizations.of(context)!.translate(AppStrings.canceled).toString(),
        style: Theme.of(context)
            .textTheme
            .headline1
            ?.copyWith(color: AppColors.darkBlue),
      );
    } else if (currentTab == 2) {
      return Text(
        AppLocalizations.of(context)!.translate(AppStrings.orders).toString(),
        style: Theme.of(context)
            .textTheme
            .headline1
            ?.copyWith(color: AppColors.darkBlue),
      );
    } else {
      return Text(
        AppLocalizations.of(context)!.translate(AppStrings.logout).toString(),
        style: Theme.of(context)
            .textTheme
            .headline1
            ?.copyWith(color: AppColors.darkBlue),
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
