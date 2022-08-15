
import 'package:flutter/material.dart';

import '../../features/home_navigator/domain/entities/order_date.dart';
import '../../features/new_orders/presentation/widgets/order_widget.dart';
import '../../features/order_completed/presentation/screens/order_completed.dart';
import '../../features/order_completed/presentation/widgets/order_completed_item.dart';
import '../../features/order_progress/presentation/widgets/in_progress_item.dart';
import '../utils/app_colors.dart';
import 'order_form_items/line.dart';
import 'order_form_items/order_header.dart';
import 'order_form_items/order_info.dart';

class OrderForm extends StatelessWidget {
  OrderForm(
      {Key? key,
      required this.isDelivered,
      required this.orderKind,
      this.orderDetails,
      this.cubitContext})
      : super(key: key);

  final OrderDetails? orderDetails;

  final bool isDelivered;
  final OrderKind orderKind;
  final GlobalKey<FormState> globalKey = GlobalKey();
  final BuildContext? cubitContext;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderHeader(
                header: orderDetails!.state,
                orderKind: orderKind,
                date: orderDetails!.createdAt,
                orderID: orderDetails!.id.toString(),
                isDelivered:
                    orderDetails!.serviceType == "delivery" ? true : false,
              ),
              const SizedBox(height: 10),
              const NewLine(),
              OrderInfo(
                customerName: orderDetails!.customer.name,
                customerPhone: orderDetails!.customer.firstPhone,
                email: orderDetails!.customer.email,
                items: orderDetails!.items,
              ),
              const SizedBox(height: 10),
              const NewLine(),
              const SizedBox(height: 10),
              order(orderDetails!, orderKind, context)
            ],
          ),
        ),
      ),
    );
  }

  Widget order(OrderDetails orderDetails, orderKind, context) {
    if (orderDetails.state == "in-progress") {
      return InProgressItem(
        globalKey: globalKey,
      );
    } else if (orderDetails.state == "pending") {
      return PendingOrderItem(globalKey: globalKey, orderDetails: orderDetails, cubitContext: cubitContext!,);
    } else if (orderDetails.state == "canceled") {
      // return PendingOrderItem(globalKey: globalKey, orderDetails: orderDetails);
      return OrderCompletedItem(
        orderDetails: orderDetails,
        printReceiptClick: () {},
      );
    } else if (orderDetails.state == "rejected") {
      // return PendingOrderItem(globalKey: globalKey, orderDetails: orderDetails);
      return OrderCompletedItem(
        orderDetails: orderDetails,
        printReceiptClick: () {},
      );
    } else {
      return OrderCompletedItem(
        orderDetails: orderDetails,
        printReceiptClick: () {},
      );
    }
  }
}
