import 'package:cashir/features/cancelled_orders/presentation/screens/cancelled_orders_screen.dart';
import 'package:cashir/features/new_orders/presentation/screens/new_orders_screen.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/error_widget.dart' as error_widget;
import '../../../order_completed/presentation/screens/order_completed.dart';
import '../../../order_progress/presentation/screens/progress_order.dart';
import '../../../order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
import '../../../rejected_orders/presentation/screens/rejected_orders_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarStatusCubit, TabBarStatusState>(
      builder: (BuildContext context, state) {
        if (state is AllOrdersLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state is AllOrdersLoaded) {
          return ContainedTabBarView(
            tabBarProperties: const TabBarProperties(height: 100),
            tabs: [
              Column(
                children: [
                  Text(
                    "${context.read<TabBarStatusCubit>().delivery.length}",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        color:
                            newIndex == 0 ? AppColors.primary : AppColors.grey),
                  ),
                  Text(AppStrings.delivery,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: newIndex == 0
                              ? AppColors.primary
                              : AppColors.grey)),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${context.read<TabBarStatusCubit>().takeAway.length}",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        color:
                            newIndex == 1 ? AppColors.primary : AppColors.grey),
                  ),
                  Text(AppStrings.takeaway,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: newIndex == 1
                              ? AppColors.primary
                              : AppColors.grey)),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${context.read<TabBarStatusCubit>().canceled.length}",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        color:
                            newIndex == 2 ? AppColors.primary : AppColors.grey),
                  ),
                  Text(AppStrings.cancelled,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: newIndex == 2
                              ? AppColors.primary
                              : AppColors.grey)),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${context.read<TabBarStatusCubit>().rejected.length}",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        color:
                            newIndex == 3 ? AppColors.primary : AppColors.grey),
                  ),
                  Text(AppStrings.rejected,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: newIndex == 3
                              ? AppColors.primary
                              : AppColors.grey)),
                ],
              ),
            ],
            views: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderCompletedScreen(
                    orderDetails: context.read<TabBarStatusCubit>().delivery),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderCompletedScreen(
                    orderDetails: context.read<TabBarStatusCubit>().takeAway),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CancelledOrdersScreen(
                    orderDetails: context.read<TabBarStatusCubit>().canceled),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: RejectedOrdersScreen(
                    orderDetails: context.read<TabBarStatusCubit>().rejected),
              ),
            ],
            onChange: (index) {
              setState(() {
                newIndex = index;
              });
            },
          );
        } else if (state is AllOrdersError) {
          return error_widget.ErrorWidget(
            onPressed: () => context.read<TabBarStatusCubit>().getAllOrders(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.red,
            ),
          );
        }
      },
    );
  }
}
