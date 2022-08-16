import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/features/order_completed/presentation/screens/order_completed.dart';
import 'package:cashir/features/order_progress/presentation/screens/progress_order.dart';
import 'package:cashir/features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/error_widget.dart' as error_widget;
import '../../../home_navigator/domain/entities/order_date.dart';
import '../../../new_orders/presentation/cubit/acceptor_cubit.dart';
import '../../../new_orders/presentation/screens/new_orders_screen.dart';

class OrderStatusTabBar extends StatefulWidget {
  const OrderStatusTabBar({Key? key, required this.stateOrderList})
      : super(key: key);
  final List<List<OrderDetails>> stateOrderList;

  @override
  State<OrderStatusTabBar> createState() => _OrderStatusTabBarState();
}

class _OrderStatusTabBarState extends State<OrderStatusTabBar> {
  int newIndex = 0;

  checkList() {
    if (BlocProvider.of<AcceptorCubit>(context).pending.isEmpty &&
        BlocProvider.of<AcceptorCubit>(context).progress.isEmpty &&
        BlocProvider.of<AcceptorCubit>(context).completed.isEmpty&&
        BlocProvider.of<AcceptorCubit>(context).canceled.isEmpty&&
        BlocProvider.of<AcceptorCubit>(context).rejected.isEmpty) {
      BlocProvider.of<TabBarStatusCubit>(context).changeLength(
          widget.stateOrderList[0].length,
          widget.stateOrderList[1].length,
          widget.stateOrderList[2].length,
          canceled: widget.stateOrderList[3].length,
          rejected: widget.stateOrderList[4].length,
          "start");
      BlocProvider.of<AcceptorCubit>(context)
          .pending
          .addAll(widget.stateOrderList[0]);
      BlocProvider.of<AcceptorCubit>(context)
          .progress
          .addAll(widget.stateOrderList[1]);
      BlocProvider.of<AcceptorCubit>(context)
          .completed
          .addAll(widget.stateOrderList[2]);
      BlocProvider.of<AcceptorCubit>(context)
          .canceled
          .addAll(widget.stateOrderList[3]);
      BlocProvider.of<AcceptorCubit>(context)
          .rejected
          .addAll(widget.stateOrderList[4]);
    }
  }

  @override
  void initState() {
    super.initState();
    checkList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AcceptorCubit, AcceptorState>(
      builder: (BuildContext context, state) {
        if (state is AcceptorLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }
        else if (state is AcceptorLoaded) {
          return ContainedTabBarView(
            tabBarProperties: const TabBarProperties(height: 100),
            tabs: [
              Column(
                children: [
                  Text(
                    "${context.read<AcceptorCubit>().pending.length}",
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
                    "${context.read<AcceptorCubit>().progress.length}",
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
                    "${context.read<AcceptorCubit>().completed.length}",
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
                    orderDetails:
                        BlocProvider.of<AcceptorCubit>(context).pending),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderProgressScreen(
                    orderDetails:
                        BlocProvider.of<AcceptorCubit>(context).progress),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderCompletedScreen(
                    orderDetails:
                        BlocProvider.of<AcceptorCubit>(context).completed),
              ),
            ],
            onChange: (index) {
              setState(() {
                newIndex = index;
              });
            },
          );
        } else if (state is AcceptorInitial) {
          return ContainedTabBarView(
            tabBarProperties: const TabBarProperties(height: 100),
            tabs: [
              Column(
                children: [
                  Text(
                    "${context.read<AcceptorCubit>().pending.length}",
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
                    "${context.read<AcceptorCubit>().progress.length}",
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
                    "${context.read<AcceptorCubit>().completed.length}",
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
                    orderDetails:
                        BlocProvider.of<AcceptorCubit>(context).pending),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderProgressScreen(
                    orderDetails:
                        BlocProvider.of<AcceptorCubit>(context).progress),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderCompletedScreen(
                    orderDetails:
                        BlocProvider.of<AcceptorCubit>(context).completed),
              ),
            ],
            onChange: (index) {
              setState(() {
                newIndex = index;
              });
            },
          );
        } else if(state is ProgressLoaded){
          return ContainedTabBarView(
            tabBarProperties: const TabBarProperties(height: 100),
            tabs: [
              Column(
                children: [
                  Text(
                    "${context.read<AcceptorCubit>().pending.length}",
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
                    "${context.read<AcceptorCubit>().progress.length}",
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
                    "${context.read<AcceptorCubit>().completed.length}",
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
                    orderDetails:
                    BlocProvider.of<AcceptorCubit>(context).pending),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderProgressScreen(
                    orderDetails:
                    BlocProvider.of<AcceptorCubit>(context).progress),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: OrderCompletedScreen(
                    orderDetails:
                    BlocProvider.of<AcceptorCubit>(context).completed),
              ),
            ],
            onChange: (index) {
              setState(() {
                newIndex = index;
              });
            },
          );
        }else{
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
