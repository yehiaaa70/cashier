import 'package:cashir/features/order_progress/presentation/widgets/order_progress_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/order_form.dart';
import '../../../order_completed/presentation/screens/order_completed.dart';

class OrderProgressScreen extends StatelessWidget {
  const OrderProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return OrderForm(isDelivered: false, orderKind: OrderKind.inProgress,);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 20),
        itemCount: 8);
  }
}
