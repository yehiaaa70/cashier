import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/features/cancelled_orders/presentation/screens/cancelled_orders_screen.dart';
import 'package:cashir/features/order_completed/presentation/screens/order_completed.dart';
import 'package:cashir/features/order_progress/presentation/screens/progress_order.dart';
import 'package:cashir/features/rejected_orders/presentation/screens/rejected_orders_screen.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/title_scroll_navigation.dart';

import '../../../../core/utils/app_strings.dart';

class CancelledOrdersTabbarScreen extends StatefulWidget {
  const CancelledOrdersTabbarScreen({Key? key}) : super(key: key);

  @override
  State<CancelledOrdersTabbarScreen> createState() => _CancelledOrdersTabbarScreenState();
}

class _CancelledOrdersTabbarScreenState extends State<CancelledOrdersTabbarScreen> {
  int newIndex=0;
  @override
  Widget build(BuildContext context) {
    return  ContainedTabBarView(
      tabBarProperties: const TabBarProperties(height: 100),
      tabs: [
        Column(
          children: [
            Text(
              "7",
              style: Theme.of(context).textTheme.headline1?.copyWith(color: newIndex==0?AppColors.primary:AppColors.grey),
            ),
            Text("Cancelled",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: newIndex==0?AppColors.primary:AppColors.grey)),
          ],
        ),
        Column(
          children: [
            Text(
              "12",
              style: Theme.of(context).textTheme.headline1?.copyWith(color: newIndex==1?AppColors.primary:AppColors.grey),
            ),
            Text("Rejected",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: newIndex==1?AppColors.primary:AppColors.grey)),
          ],
        ),
      ],
      views: const [
        CancelledOrdersScreen(),
        RejectedOrdersScreen(),
      ],
      onChange: (index) {
        setState(() {
          newIndex=index;
          print(newIndex);
        });
      },
    );
  }
}
