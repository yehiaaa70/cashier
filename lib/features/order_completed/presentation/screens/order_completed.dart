import 'package:cashir/features/order_completed/presentation/widgets/order_completed_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/order_form.dart';

enum OrderKind { completed, cancelled, rejected ,inProgress,newOrder}

class OrderCompletedScreen extends StatelessWidget {
  const OrderCompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return OrderForm(isDelivered: true, orderKind: OrderKind.completed,);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 20),
        itemCount: 8);
  }
}
