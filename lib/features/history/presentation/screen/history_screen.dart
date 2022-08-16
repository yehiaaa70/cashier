import 'package:cashir/features/cancelled_orders/presentation/screens/cancelled_orders_screen.dart';
import 'package:cashir/features/history/presentation/cubit/history_cubit.dart';
import 'package:cashir/features/home_navigator/presentation/cubit/home_navigator_cubit.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_navigator/domain/entities/order_date.dart';
import '../../../order_completed/presentation/screens/order_completed.dart';
import '../../../rejected_orders/presentation/screens/rejected_orders_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key, required this.stateOrderList})
      : super(key: key);
  final List<List<OrderDetails>> stateOrderList;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int newIndex = 0;

  @override
  void initState() {
    super.initState();
    print("ooooooooooooooooooooooo");
    print("heeeeeeeeeeeeer");
    BlocProvider.of<HistoryCubit>(context).getHistoryOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (BuildContext context, state) {
        if (state is HistoryLoading) {
          return Container(
            color: AppColors.background,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
        } else if (state is HistoryLoaded) {
          return ContainedTabBarView(
            tabBarProperties: const TabBarProperties(height: 100),
            tabs: [
              Column(
                children: [
                  Text(
                    "${widget.stateOrderList[0].length}",
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
                    "${widget.stateOrderList[1].length}",
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
                    "${widget.stateOrderList[2].length}",
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
                    "${widget.stateOrderList[3].length}",
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
                    orderDetails: widget.stateOrderList[0]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderCompletedScreen(
                    orderDetails: widget.stateOrderList[1]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CancelledOrdersScreen(
                    orderDetails: widget.stateOrderList[2]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: RejectedOrdersScreen(
                    orderDetails: widget.stateOrderList[3]),
              ),
            ],
            onChange: (index) {
              setState(() {
                newIndex = index;
              });
            },
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Data Error"),
            ),
          );
        }
      },
    );
  }
}
