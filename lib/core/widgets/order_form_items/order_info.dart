import 'package:cashir/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo(
      {Key? key,
      required this.customerName,
      required this.customerPhone,
      required this.orders,
      required this.email})
      : super(key: key);

  final String customerName;
  final String customerPhone;
  final String email;
  final List<String> orders;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          customerName,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: AppColors.darkBlue),
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              customerPhone,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: AppColors.darkBlue, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
            Image.asset(ImageAssets.callIcon,
                width: 30, height: 30, fit: BoxFit.fill)
          ],
        ),
        Text(
          email,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: AppColors.darkBlue, fontSize: 15),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 10,
        ),
        ...List.generate(
          orders.length,
          (index) => Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.grey, width: 1)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: Text(
                    orders[index],
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.darkBlue),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 8)
            ],
          ),
        ),
      ],
    );
  }
}
