import 'package:cashir/features/cancelled_orders/presentation/screens/cancelled_orders_screen.dart';
import 'package:cashir/features/new_orders/presentation/screens/new_orders_screen.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../new_orders/presentation/widgets/order_widget.dart';
import '../../../order_completed/presentation/screens/order_completed.dart';
import '../../../order_progress/presentation/screens/progress_order.dart';
import '../../../rejected_orders/presentation/screens/rejected_orders_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int newIndex=0;

  @override
  Widget build(BuildContext context) {
    return  ContainedTabBarView(
      tabBarProperties: TabBarProperties(height: 100),
      tabs: [
        Column(
          children: [
            Text(
              "7",
              style: Theme.of(context).textTheme.headline1?.copyWith(color: newIndex==0?AppColors.primary:AppColors.grey),
            ),
            Text(AppStrings.completedOrder,
                style: Theme.of(context).textTheme.headline6?.copyWith(color: newIndex==0?AppColors.primary:AppColors.grey)),
          ],
        ),
        Column(
          children: [
            Text(
              "12",
              style: Theme.of(context).textTheme.headline1?.copyWith(color: newIndex==1?AppColors.primary:AppColors.grey),
            ),
            Text(AppStrings.inProgressOrder,
                style: Theme.of(context).textTheme.headline6?.copyWith(color: newIndex==1?AppColors.primary:AppColors.grey)),
          ],
        ),
        Column(
          children: [
            Text(
              "87",
              style: Theme.of(context).textTheme.headline1?.copyWith(color: newIndex==2?AppColors.primary:AppColors.grey),
            ),
            Text("Cancelled",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: newIndex==2?AppColors.primary:AppColors.grey)),
          ],
        ),
        Column(
          children: [
            Text(
              "100",
              style: Theme.of(context).textTheme.headline1?.copyWith(color: newIndex==3?AppColors.primary:AppColors.grey),
            ),
            Text("Rejected",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: newIndex==3?AppColors.primary:AppColors.grey)),
          ],
        ),
      ],
      views: const [
        OrderCompletedScreen(),
        OrderProgressScreen(),
        CancelledOrdersScreen(),
        RejectedOrdersScreen()
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
