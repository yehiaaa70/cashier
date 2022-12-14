import 'package:flutter/material.dart';

import '../../../../core/widgets/order_form.dart';
import '../../../home_navigator/domain/entities/order_date.dart';
import '../../../order_completed/presentation/screens/order_completed.dart';

class OrderProgressScreen extends StatelessWidget {
  const OrderProgressScreen({Key? key, required this.orderDetails})
      : super(key: key);
  final List<OrderDetails> orderDetails;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return OrderForm(
            isDelivered: false,
            orderKind: OrderKind.inProgress,
            orderDetails: orderDetails[index],
            cubitContext: context,
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 20),
        itemCount: orderDetails.length);
  }
}
