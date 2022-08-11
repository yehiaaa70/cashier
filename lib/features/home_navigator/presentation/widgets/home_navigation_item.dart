import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/core/utils/assets_manager.dart';
import 'package:cashir/features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';

class HomeNavigationItem extends StatelessWidget {
  const HomeNavigationItem(
      {Key? key,
      required this.tabItem,
      required this.imageAsset,
      required this.text})
      : super(key: key);
  final TabItem tabItem;
  final String imageAsset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (BlocProvider.of<HomeNavigatorCubit>(context).getCurrentTab !=
            tabItem) ...{
          const SizedBox(
            height: 20,
          ),
        },
        Image.asset(imageAsset,
            width: 25,
            height: 25,
            color: BlocProvider.of<HomeNavigatorCubit>(context).getCurrentTab ==
                    tabItem
                ? AppColors.white
                : Colors.grey[400]),
        BlocProvider.of<HomeNavigatorCubit>(context).getCurrentTab != tabItem
            ? Text(text)
            : const SizedBox()
      ],
    );
  }
}
