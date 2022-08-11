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
      required this.isDelivered})
      : super(key: key);
  final OrderKind orderKind;
  final bool isDelivered;
  final String date;
  final String orderID;

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    if (orderKind == OrderKind.completed) {
      statusColor=AppColors.darkGreen;
    } else if (orderKind == OrderKind.inProgress) {
      statusColor=AppColors.secondary;
    } else {
      statusColor=AppColors.red;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${orderKind.name.toUpperCase()} ON",
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
                status: isDelivered ? "Delivery" : "Take away"),
          ],
        ),
      ],
    );
  }
}
