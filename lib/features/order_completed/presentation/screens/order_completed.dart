import 'package:cashir/features/order_completed/presentation/widgets/order_completed_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/order_form.dart';
import '../../../home_navigator/domain/entities/order_date.dart';

enum OrderKind { completed, cancelled, rejected, inProgress, newOrder }

class OrderCompletedScreen extends StatelessWidget {
  const OrderCompletedScreen({Key? key, required this.orderDetails})
      : super(key: key);
  final List<OrderDetails> orderDetails;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return OrderForm(
            isDelivered:
                orderDetails[index].serviceType == "delivery" ? true : false,
            orderKind: OrderKind.completed,
            orderDetails: orderDetails[index],
            cubitContext: context,
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 20),
        itemCount: orderDetails.length);
  }
}
