import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/core/utils/assets_manager.dart';
import 'package:cashir/core/utils/convert_numbers_method.dart';
import 'package:cashir/core/widgets/order_status.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/order_button.dart';
import '../../../../core/widgets/order_form_items/line.dart';
import '../../../../core/widgets/order_form_items/order_location.dart';
import '../../../../core/widgets/order_form_items/total_details_row.dart';
import '../../../home_navigator/domain/entities/order_date.dart';

class OrderCompletedItem extends StatelessWidget {
  OrderCompletedItem(
      {Key? key, required this.orderDetails, required this.printReceiptClick})
      : super(key: key);
  final OrderDetails orderDetails;
  final VoidCallback printReceiptClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: OrderButton(
                text: AppLocalizations.of(context)!
                    .translate(AppStrings.printReceiptText)
                    .toString(),
                onClick: printReceiptClick,
                textColor: AppColors.white,
                buttonColor: AppColors.secondary,
                radius: 12,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  TotalDetails(
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.supTotalText)
                          .toString(),
                      money: orderDetails.subtotal),
                  TotalDetails(
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.deliveryFeeText)
                          .toString(),
                      money: orderDetails.deliveryFees),
                  TotalDetails(
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.serviceText)
                          .toString(),
                      money: "+0+"),
                  TotalDetails(
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.taxText)
                          .toString(),
                      money: orderDetails.taxes),
                  TotalDetails(
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.discountText)
                          .toString(),
                      money: "+0+"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.translate(AppStrings.totalText).toString()} :   ",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        "${AppLocalizations.of(context)!.translate(AppStrings.srText).toString()} ${AppLocalizations.of(context)!.isEnLocale ? orderDetails.total : replaceToArabicNumber(orderDetails.total)}",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
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
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              )
      ],
    );
  }
}
