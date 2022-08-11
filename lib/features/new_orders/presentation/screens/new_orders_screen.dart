import 'package:cashir/features/new_orders/presentation/cubit/order_cubit.dart';
import 'package:cashir/features/new_orders/presentation/widgets/order_widget.dart';
import 'package:cashir/features/new_orders/presentation/widgets/orders_status_widget.dart';
import 'package:cashir/features/order_completed/presentation/screens/order_completed.dart';
import 'package:cashir/features/order_progress/presentation/screens/progress_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/order_form.dart';

class NewOrdersScreen extends StatelessWidget {
  const NewOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return OrderForm(isDelivered: true, orderKind: OrderKind.newOrder,);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 20),
        itemCount: 8);
  }
}
