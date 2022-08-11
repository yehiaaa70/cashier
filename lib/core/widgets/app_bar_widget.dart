import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes/app_routes.dart';
import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: BlocBuilder<HomeNavigatorCubit, HomeNavigatorState>(
          builder: (context, state) {
        if (state.currentTab == TabItem.Offers) {
          return Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    AppStrings.offers,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: AppColors.darkBlue),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.addOffersRoute);
                    },
                    child: SvgPicture.asset(
                      ImageAssets.addItem,
                    ))
              ],
            ),
          );
        } else {
          return Text(
            state.currentTab.name,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: AppColors.darkBlue),
          );
        }
      }),
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

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
