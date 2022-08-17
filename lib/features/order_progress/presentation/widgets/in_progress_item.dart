import 'package:cashir/core/utils/assets_manager.dart';
import 'package:cashir/core/widgets/alert_dialog.dart';
import 'package:cashir/features/new_orders/presentation/cubit/acceptor_cubit.dart';
import 'package:cashir/features/order_progress/presentation/cubit/progress_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/local/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/order_button.dart';
import '../../../home_navigator/domain/entities/order_date.dart';

class InProgressItem extends StatelessWidget {
  const InProgressItem(
      {Key? key,
      required this.globalKey,
      required this.orderDetails,
      required this.cubitContext})
      : super(key: key);
  final GlobalKey<FormState> globalKey;

  final OrderDetails orderDetails;
  final BuildContext cubitContext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.grey,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: OrderButton(
                  text:  AppLocalizations.of(context)!
                      .translate(AppStrings.cancelButton)
                      .toString(),
                  onClick: () {
                    CustomAlert.alert(
                        title:  AppLocalizations.of(context)!
                            .translate(AppStrings.alertMessagePending)
                            .toString(),
                        context: context,
                        orderDetails: orderDetails,
                        cubitContext: cubitContext,
                        state: "progress"
                    ).show();
                  },
                  textColor: AppColors.red,
                  buttonColor: AppColors.red,
                  radius: 25,
                )),
            const SizedBox(width: 8),
            Expanded(
                child: OrderButton(
              text: orderDetails.serviceType == "delivery"
                  ? AppLocalizations.of(context)!
                  .translate(AppStrings.deliveredButton)
                  .toString()
                  : AppLocalizations.of(context)!
                  .translate(AppStrings.takenButton)
                  .toString(),
              onClick: () {
                BlocProvider.of<AcceptorCubit>(cubitContext)
                    .completedOrders(orderDetails);
              },
              textColor: AppColors.white,
              buttonColor: AppColors.darkGreen,
              radius: 25,
            )),
          ],
        )
      ],
    );
  }
}
