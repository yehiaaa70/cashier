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
            OrderButton(
              text: AppLocalizations.of(context)!
                  .translate(AppStrings.printReceiptText)
                  .toString(),
              onClick: printReceiptClick,
              textColor: AppColors.white,
              buttonColor: AppColors.secondary,
              radius: 12,
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  TotalDetails(
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.supTotalText)
                          .toString(),
                    money:   "${AppLocalizations.of(context)!.isEnLocale ? orderDetails.subtotal : replaceToArabicNumber(orderDetails.subtotal.toString())}",
                  ),
                  TotalDetails(
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.deliveryFeeText)
                          .toString(),
                      money:   "${AppLocalizations.of(context)!.isEnLocale ? orderDetails.deliveryFees : replaceToArabicNumber(orderDetails.deliveryFees.toString())}",

                  ),
                  TotalDetails(
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.serviceText)
                          .toString(),
                      money: "+0+"),
                  TotalDetails(
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.taxText)
                          .toString(),
                      money: "${AppLocalizations.of(context)!.isEnLocale ? orderDetails.taxes : replaceToArabicNumber(orderDetails.taxes.toString())}"),
                  TotalDetails(
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.discountText)
                          .toString(),
                      money: "+0+"),
                  Row(
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.translate(AppStrings.totalText).toString()} :   ",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        " ${AppLocalizations.of(context)!.isEnLocale ? orderDetails.total : replaceToArabicNumber(orderDetails.total)} ${AppLocalizations.of(context)!.translate(AppStrings.srText).toString()}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: AppColors.black,fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
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
                    AppLocalizations.of(context)!
                        .translate(AppStrings.pickedFrom)
                        .toString() ,
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
