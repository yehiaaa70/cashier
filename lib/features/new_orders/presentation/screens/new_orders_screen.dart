import 'package:cashir/features/new_orders/presentation/widgets/order_widget.dart';
import 'package:cashir/features/new_orders/presentation/widgets/orders_status_widget.dart';
import 'package:cashir/features/order_completed/presentation/screens/order_completed.dart';
import 'package:cashir/features/order_progress/presentation/screens/progress_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/order_form.dart';
import '../../../home_navigator/domain/entities/order_date.dart';
import '../cubit/acceptor_cubit.dart';

class NewOrdersScreen extends StatelessWidget {
  const NewOrdersScreen({Key? key, required this.orderDetails})
      : super(key: key);
  final List<OrderDetails> orderDetails;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return OrderForm(
            isDelivered:
                orderDetails[index].serviceType == "delivery" ? true : false,
            orderKind: OrderKind.newOrder,
            orderDetails: orderDetails[index],
            cubitContext: context,
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 20),
        itemCount: orderDetails.length);
  }
}
