import 'package:cashir/features/new_orders/presentation/cubit/acceptor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    "Picked Up From",
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
        // Text(AppStrings.denyReason,
        //     style: Theme.of(context).textTheme.headline6),
        // TextFormField(
        //   decoration: InputDecoration(
        //       fillColor: AppColors.white,
        //       filled: true,
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(10),
        //       )),
        //   validator: (value) {
        //     if (value != null && value.isNotEmpty) {
        //       return null;
        //     } else {
        //       return AppStrings.insertReason;
        //     }
        //   },
        //   onSaved: (value) {},
        // ),
        // const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: OrderButton(
              text: 'Cancel',
              onClick: () {
                CustomAlert.alert(
                        title: "Cancel To Cancel Order \n Reject to Reject Order",
                        context: context,
                  desc: "hint : you should fill the Reason"
                )
                    .show();

                // if (globalKey.currentState!.validate()) {}
              },
              textColor: AppColors.red,
              buttonColor: AppColors.red,
              radius: 25,
            )),
            const SizedBox(width: 8),
            Expanded(
                child: OrderButton(
              text: 'Accept',
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
