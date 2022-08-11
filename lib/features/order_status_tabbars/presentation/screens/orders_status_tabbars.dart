import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/features/order_completed/presentation/screens/order_completed.dart';
import 'package:cashir/features/order_progress/presentation/screens/progress_order.dart';
import 'package:cashir/features/order_status_tabbars/presentation/widgets/order_status_widget.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../new_orders/presentation/screens/new_orders_screen.dart';

class OrderStatusTabBar extends StatefulWidget {
  const OrderStatusTabBar({Key? key}) : super(key: key);

  @override
  State<OrderStatusTabBar> createState() => _OrderStatusTabBarState();
}

class _OrderStatusTabBarState extends State<OrderStatusTabBar> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ContainedTabBarView(
      tabBarProperties: const TabBarProperties(height: 100),
      tabs: [
        Column(
          children: [
            Text(
              '12',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: newIndex == 0 ? AppColors.primary : AppColors.grey),
            ),
            Text(AppStrings.newOrder,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: newIndex == 0 ? AppColors.primary : AppColors.grey)),
          ],
        ),
        Column(
          children: [
            Text(
              '1',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: newIndex == 1 ? AppColors.primary : AppColors.grey),
            ),
            Text(AppStrings.inProgressOrder,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: newIndex == 1 ? AppColors.primary : AppColors.grey)),
          ],
        ),
        Column(
          children: [
            Text(
              "7",
              style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: newIndex == 2 ? AppColors.primary : AppColors.grey),
            ),
            Text(AppStrings.completedOrder,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: newIndex == 2 ? AppColors.primary : AppColors.grey)),
          ],
        ),
      ],
      views: const [
        NewOrdersScreen(),
        OrderProgressScreen(),
        OrderCompletedScreen(),
      ],
      onChange: (index) {
        setState(() {
          newIndex = index;
        });
      },
    );
  }
}
