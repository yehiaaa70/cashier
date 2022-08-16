import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/core/utils/convert_numbers_method.dart';
import 'package:cashir/core/widgets/order_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../features/order_completed/presentation/screens/order_completed.dart';
import '../../utils/app_colors.dart';
import '../order_status.dart';

class OrderHeader extends StatelessWidget {
  OrderHeader(
      {Key? key,
      required this.orderKind,
      required this.date,
      required this.orderID,
      required this.isDelivered,
      this.header})
      : super(key: key);
  final OrderKind orderKind;
  final bool isDelivered;
  final String date;
  final String orderID;
  final String? header;

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String title;

    if (header == "completed") {
      statusColor = AppColors.darkGreen;
      title = AppLocalizations.of(context)!
          .translate(AppStrings.completedOn)
          .toString();
    } else if (header == "pending") {
      statusColor = AppColors.lightGreen;
      title = AppLocalizations.of(context)!
          .translate(AppStrings.completedOn)
          .toString();
    } else if (header == "in-progress") {
      statusColor = AppColors.secondary;
      title = AppLocalizations.of(context)!
          .translate(AppStrings.inProgressOrder)
          .toString();
    } else if (header == "canceled") {
      statusColor = AppColors.red;
      title = AppLocalizations.of(context)!
          .translate(AppStrings.canceledOn)
          .toString();
    } else {
      statusColor = AppColors.red;
      title = '';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.bold)),
            Text(DateFormat('MM/dd/yyyy hh:mm a')
                .format(DateTime.parse(date))
                .toString()),
          ],
        ),
        Column(
          children: [
            Text(
              "${AppLocalizations.of(context)!.translate(AppStrings.orderId).toString()} ${AppLocalizations.of(context)!.isEnLocale ? orderID : replaceToArabicNumber(orderID)}",
              style:
                  Theme.of(context).textTheme.headline5!.copyWith(fontSize: 18),
            ),
            OrderStatus(
                containerColor: statusColor,
                status: isDelivered
                    ? AppLocalizations.of(context)!
                        .translate(AppStrings.delivery)
                        .toString()
                    : AppLocalizations.of(context)!
                        .translate(AppStrings.takeaway)
                        .toString()),
          ],
        ),
      ],
    );
  }
}
