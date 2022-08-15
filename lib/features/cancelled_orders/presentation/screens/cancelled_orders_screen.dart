import 'package:flutter/material.dart';

import '../../../../core/widgets/order_form.dart';
import '../../../home_navigator/domain/entities/order_date.dart';
import '../../../order_completed/presentation/screens/order_completed.dart';

class CancelledOrdersScreen extends StatelessWidget {
  const CancelledOrdersScreen({Key? key, required this.orderDetails}) : super(key: key);
  final List<OrderDetails> orderDetails;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return OrderForm(isDelivered: true, orderKind: OrderKind.cancelled,orderDetails:orderDetails[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: orderDetails.length);

  }
}
