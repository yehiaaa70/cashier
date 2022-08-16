import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/features/cancelled_orders/presentation/screens/cancelled_orders_screen.dart';
import 'package:cashir/features/new_orders/presentation/cubit/acceptor_cubit.dart';
import 'package:cashir/features/rejected_orders/presentation/screens/rejected_orders_screen.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/local/app_localizations.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/convert_numbers_method.dart';
import '../../../home_navigator/domain/entities/order_date.dart';
import '../../../order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';

class CancelledOrdersTabBarScreen extends StatefulWidget {
  const CancelledOrdersTabBarScreen({Key? key, required this.stateOrderList})
      : super(key: key);
  final List<List<OrderDetails>> stateOrderList;

  @override
  State<CancelledOrdersTabBarScreen> createState() =>
      _CancelledOrdersTabBarScreenState();
}

class _CancelledOrdersTabBarScreenState
    extends State<CancelledOrdersTabBarScreen> {
  int newIndex = 0;

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
        return  ContainedTabBarView(
          tabBarProperties: const TabBarProperties(height: 100),
          tabs: [
            Column(
              children: [
                Text(
                  "${context.read<AcceptorCubit>().canceled.length}",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      color:
                      newIndex == 0 ? AppColors.primary : AppColors.grey),
                ),
                Text(AppStrings.cancelled,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: newIndex == 0
                            ? AppColors.primary
                            : AppColors.grey)),
              ],
            ),
            Column(
              children: [
                Text(
                  "${context.read<AcceptorCubit>().rejected.length}",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      color:
                      newIndex == 1 ? AppColors.primary : AppColors.grey),
                ),
                Text(AppStrings.rejected,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: newIndex == 1
                            ? AppColors.primary
                            : AppColors.grey)),
              ],
            ),
          ],
          views: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: CancelledOrdersScreen(
                  orderDetails: BlocProvider.of<AcceptorCubit>(context).canceled),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: RejectedOrdersScreen(
                  orderDetails: BlocProvider.of<AcceptorCubit>(context).rejected),
            ),
          ],
          onChange: (index) {
            setState(() {
              newIndex = index;
            });
          },
        );
      }else if (state is AcceptorInitial) {
        return ContainedTabBarView(
          tabBarProperties: const TabBarProperties(height: 100),
          tabs: [
          Column(
          children: [
            Text(
              // "${widget.stateOrderList[0].length}",
              "${AppLocalizations.of(context)!.isEnLocale ? widget.stateOrderList[0].length : replaceToArabicNumber(widget.stateOrderList[0].length.toString())}",
              style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: newIndex == 0 ? AppColors.primary : AppColors.grey),
            ),
            Text(
                AppLocalizations.of(context)!
                    .translate(AppStrings.canceled)
                    .toString(),
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: newIndex == 0 ? AppColors.primary : AppColors.grey)),
          ],
        ),
        Column(
          children: [
            Text(
              // "${widget.stateOrderList[1].length}",
              "${AppLocalizations.of(context)!.isEnLocale ? widget.stateOrderList[1].length : replaceToArabicNumber(widget.stateOrderList[1].length.toString())}",
              style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: newIndex == 1 ? AppColors.primary : AppColors.grey),
            ),
            Text(
                AppLocalizations.of(context)!
                    .translate(AppStrings.rejected)
                    .toString(),
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: newIndex == 1 ? AppColors.primary : AppColors.grey)),
          ],
        ),
          ],
          views: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: CancelledOrdersScreen(
                  orderDetails: widget.stateOrderList[0]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: RejectedOrdersScreen(
                  orderDetails: widget.stateOrderList[1]),
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
        });
  }
}
