import 'package:cashir/features/new_orders/presentation/cubit/acceptor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/local/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/alert_dialog.dart';
import '../../../../core/widgets/order_button.dart';
import '../../../../core/widgets/order_form_items/line.dart';
import '../../../../core/widgets/order_form_items/order_location.dart';
import '../../../home_navigator/domain/entities/order_date.dart';

class PendingOrderItem extends StatelessWidget {
  const PendingOrderItem(
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
        const NewLine(),
        const SizedBox(height: 10),
        orderDetails.serviceType == "delivery"
            ? OrderLocationWidget(
                orderDetails: orderDetails,
              )
            : Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .translate(AppStrings.pickedFrom)
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: AppColors.black),
                  ),
                  Text(
                    orderDetails.branch.addressDescriptionEn,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.secondary),
                  ),
                ],
              ),
        const SizedBox(height: 20),
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
                  state: "pending"
                ).show();
              },
              textColor: AppColors.red,
              buttonColor: AppColors.red,
              radius: 25,
            )),
            const SizedBox(width: 8),
            Expanded(
                child: OrderButton(
              text: AppLocalizations.of(context)!
                  .translate(AppStrings.acceptButton)
                  .toString(),
              onClick: () {
                BlocProvider.of<AcceptorCubit>(cubitContext)
                    .acceptOrders(orderDetails);
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
