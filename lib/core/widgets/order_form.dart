import 'package:cashir/core/utils/assets_manager.dart';
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

class OrderForm extends StatefulWidget {
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
  final BuildContext? cubitContext;

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  bool _openItem = false;

  final GlobalKey<FormState> globalKey = GlobalKey();

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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderHeader(
                header: widget.orderDetails!.state,
                orderKind: widget.orderKind,
                date: widget.orderDetails!.createdAt,
                orderID: widget.orderDetails!.id.toString(),
                isDelivered: widget.orderDetails!.serviceType == "delivery"
                    ? true
                    : false,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            _openItem = !_openItem;
                          });
                        },
                        icon: _openItem
                            ? Image.asset(ImageAssets.upArrow)
                            : Image.asset(ImageAssets.downArrow)),
                  ),
                ],
              ),
              SizedBox(
                height: _openItem ? null : 0,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const NewLine(),
                    OrderInfo(
                      customerName: widget.orderDetails!.customer.name,
                      customerPhone: widget.orderDetails!.customer.firstPhone,
                      email: widget.orderDetails!.customer.email,
                      items: widget.orderDetails!.items,
                    ),
                    const SizedBox(height: 10),
                    order(widget.orderDetails!, widget.orderKind)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget order(OrderDetails orderDetails, orderKind) {
    if (orderDetails.state == "in-progress") {
      return InProgressItem(
        globalKey: globalKey,
        orderDetails: orderDetails,
        cubitContext: widget.cubitContext!,
      );
    } else if (orderDetails.state == "pending") {
      return PendingOrderItem(
        globalKey: globalKey,
        orderDetails: orderDetails,
        cubitContext: widget.cubitContext!,
      );
    } else if (orderDetails.state == "canceled") {
      return Column(
        children: [
          Text(
            "The Reason ",
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.red, width: 1),
            ),
            child: Center(
              child: Text(
                orderDetails.cancellationReason,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: AppColors.grey),
              ),
            ),
          )
        ],
      );
    } else if (orderDetails.state == "rejected") {
      return Column(
        children: [
          Text(
            "The Reason ",
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.red, width: 1),
            ),
            child: Center(
              child: Text(
                orderDetails.cancellationReason,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: AppColors.grey),
              ),
            ),
          )
        ],
      );
    } else {
      return OrderCompletedItem(
        orderDetails: orderDetails,
        printReceiptClick: () {},
      );
    }
  }
}
