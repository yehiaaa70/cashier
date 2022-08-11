import 'package:cashir/core/widgets/order_form_items/line.dart';
import 'package:cashir/core/widgets/order_form_items/order_header.dart';
import 'package:cashir/core/widgets/order_form_items/order_info.dart';
import 'package:cashir/core/widgets/order_form_items/order_location.dart';
import 'package:cashir/core/widgets/order_form_items/total_details_row.dart';
import 'package:cashir/features/order_completed/presentation/screens/order_completed.dart';
import 'package:flutter/material.dart';

import '../../features/new_orders/presentation/widgets/order_widget.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/assets_manager.dart';
import 'order_button.dart';
import 'order_status.dart';

class OrderForm extends StatelessWidget {
  OrderForm({Key? key, required this.isDelivered, required this.orderKind})
      : super(key: key);

  List<String> orderItems = ["1x Pizza", "2x Pepsi", "3x Water"];

  final bool isDelivered;
  final OrderKind orderKind;
  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
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
                orderKind: orderKind,
                date: "June 2, 2021",
                orderID: "25",
                isDelivered: isDelivered,
              ),
              const SizedBox(height: 10),
              const NewLine(),
              OrderInfo(
                customerName: "Yehia",
                customerPhone: "01010101010",
                orders: orderItems,
                email: 'test@gmail.com',
              ),
              const SizedBox(height: 10),
              const NewLine(),
              const SizedBox(height: 10),
              order(orderKind, context)
            ],
          ),
        ),
      ),
    );
  }

  Widget order(orderKind, context) {
    if (orderKind == OrderKind.inProgress) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("TRACK",
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Column(children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                                activeColor: AppColors.lightGreen,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Order placed",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text("June 2, 2021 at 7:00 PM",
                                        style: TextStyle(fontSize: 14)),
                                  ]),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                                activeColor: AppColors.lightGreen,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Order placed",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text("June 2, 2021 at 7:00 PM",
                                        style: TextStyle(fontSize: 14)),
                                  ])
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                                activeColor: AppColors.lightGreen,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Order placed",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text("June 2, 2021 at 7:00 PM",
                                        style: TextStyle(fontSize: 14)),
                                  ])
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                                activeColor: AppColors.lightGreen,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Order placed",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text("June 2, 2021 at 7:00 PM",
                                        style: TextStyle(fontSize: 14)),
                                  ]),
                            ],
                          )
                        ]),
                        Positioned(
                          top: 35,
                          left: 23,
                          child: Container(
                            color: AppColors.lightGreen,
                            width: 2,
                            height: 60,
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 23,
                          child: Container(
                            color: AppColors.lightGreen,
                            width: 2,
                            height: 60,
                          ),
                        ),
                        Positioned(
                          top: 168,
                          left: 23,
                          child: Container(
                            color: AppColors.lightGreen,
                            width: 2,
                            height: 60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(AppStrings.denyReason,
              style: Theme.of(context).textTheme.headline6),
          TextFormField(
            decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return null;
              } else {
                return AppStrings.insertReason;
              }
            },
            onSaved: (value) {},
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: OrderButton(
                text: 'Cancel',
                onClick: () {
                  if (_globalKey.currentState!.validate()) {}
                },
                textColor: AppColors.red,
                buttonColor: AppColors.red,
                radius: 25,
              )),
              const SizedBox(width: 8),
              Expanded(
                  child: OrderButton(
                text: 'Taken',
                onClick: () {},
                textColor: AppColors.white,
                buttonColor: AppColors.darkGreen,
                radius: 25,
              )),
            ],
          )
        ],
      );
    } else if (orderKind == OrderKind.newOrder) {
      return OrderWidget(
        isDelivery: isDelivered,
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: OrderButton(
                    text: 'Print Receipt',
                    onClick: () {},
                    textColor: AppColors.white,
                    buttonColor: AppColors.secondary,
                    radius: 12,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    TotalDetails(title: "Subtitle", money: "13.6"),
                    TotalDetails(title: "Delivery Fee", money: "+0"),
                    TotalDetails(title: "Service", money: "2.04"),
                    TotalDetails(title: "Tax(5%)", money: "-0.00"),
                    TotalDetails(title: "Discount", money: "-0.00"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total :   ",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          "SR 20",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const NewLine(),
          const SizedBox(height: 10),
          isDelivered
              ? const OrderLocationWidget()
              : Column(
                  children: [
                    Text(
                      "Picked Up From",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: AppColors.black),
                    ),
                    Text(
                      "branch 1",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                )
        ],
      );
    }
  }
}
