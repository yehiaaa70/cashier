import 'package:cashir/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/order_button.dart';
import '../../../../core/widgets/order_status.dart';

class OrderProgressItem extends StatefulWidget {
  OrderProgressItem({Key? key}) : super(key: key);

  @override
  State<OrderProgressItem> createState() => _OrderProgressItemState();
}

class _OrderProgressItemState extends State<OrderProgressItem> {
  List<String> orderItems = ["1x Pizza", "2x Pepsi", "3x "];
  final GlobalKey<FormState> _globalKey = GlobalKey();

  bool checkValue1 = false;
  bool checkValue2 = false;
  bool checkValue3 = false;
  bool checkValue4 = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("June 2,2021 at 7:00 PM"),
                  Text(
                    "Order ID 27",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              Container(
                height: 1,
                width: double.infinity - 20,
                color: AppColors.grey,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Customer Name\n',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    TextSpan(
                      text: '+123456789',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
              ...List.generate(
                orderItems.length,
                    (index) => Text(
                  orderItems[index],
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
