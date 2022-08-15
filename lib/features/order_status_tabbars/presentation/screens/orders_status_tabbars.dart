import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/features/order_completed/presentation/screens/order_completed.dart';
import 'package:cashir/features/order_progress/presentation/screens/progress_order.dart';
import 'package:cashir/features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/error_widget.dart' as error_widget;
import '../../../new_orders/presentation/screens/new_orders_screen.dart';

class OrderStatusTabBar extends StatefulWidget {
  const OrderStatusTabBar({Key? key}) : super(key: key);

  @override
  State<OrderStatusTabBar> createState() => _OrderStatusTabBarState();
}

class _OrderStatusTabBarState extends State<OrderStatusTabBar> {
  int newIndex = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TabBarStatusCubit>(context).getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarStatusCubit, TabBarStatusState>(
      builder: (BuildContext context, state) {
        if(state is OrdersChanges){
          setState((){

          });
        }if (state is AllOrdersLoading) {
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
                    "${context.read<TabBarStatusCubit>().pending.length}",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        color:
                            newIndex == 0 ? AppColors.primary : AppColors.grey),
                  ),
                  Text(AppStrings.newOrder,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: newIndex == 0
                              ? AppColors.primary
                              : AppColors.grey)),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${context.read<TabBarStatusCubit>().progress.length}",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        color:
                            newIndex == 1 ? AppColors.primary : AppColors.grey),
                  ),
                  Text(AppStrings.inProgressOrder,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: newIndex == 1
                              ? AppColors.primary
                              : AppColors.grey)),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${context.read<TabBarStatusCubit>().completed.length}",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        color:
                            newIndex == 2 ? AppColors.primary : AppColors.grey),
                  ),
                  Text(AppStrings.completedOrder,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: newIndex == 2
                              ? AppColors.primary
                              : AppColors.grey)),
                ],
              ),
            ],
            views: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: NewOrdersScreen(
                    orderDetails: context.read<TabBarStatusCubit>().pending),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderProgressScreen(
                    orderDetails: context.read<TabBarStatusCubit>().progress),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderCompletedScreen(
                    orderDetails: context.read<TabBarStatusCubit>().completed),
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
