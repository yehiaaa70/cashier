import 'package:cashir/core/widgets/order_form.dart';
import 'package:flutter/material.dart';

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
    if (header == "completed") {
      statusColor = AppColors.darkGreen;
    } else if (header == "pending") {
      statusColor = AppColors.lightGreen;
    } else if (header == "in-progress") {
      statusColor = AppColors.secondary;
    } else if (header == "canceled") {
      statusColor = AppColors.red;
    } else {
      statusColor = AppColors.red;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${header!.toUpperCase()} ON",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.bold)),
            Text(date),
          ],
        ),
        Column(
          children: [
            Text(
              "Order ID $orderID",
              style: Theme.of(context).textTheme.headline4,
            ),
            OrderStatus(
                containerColor: statusColor,
                status: isDelivered ? "Delivery" : "Takeaway"),
          ],
        ),
      ],
    );
  }
}
