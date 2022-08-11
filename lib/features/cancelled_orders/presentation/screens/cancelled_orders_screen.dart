import 'package:flutter/material.dart';

import '../../../../core/widgets/order_form.dart';
import '../../../order_completed/presentation/screens/order_completed.dart';

class CancelledOrdersScreen extends StatelessWidget {
  const CancelledOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return OrderForm(isDelivered: true, orderKind: OrderKind.cancelled,);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: 8);

  }
}
