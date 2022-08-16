import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../features/home_navigator/domain/entities/order_date.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_manager.dart';

class OrderLocationWidget extends StatefulWidget {
  const OrderLocationWidget({Key? key, required this.orderDetails})
      : super(key: key);

  final OrderDetails orderDetails;

  @override
  State<OrderLocationWidget> createState() => _OrderLocationWidgetState();
}

class _OrderLocationWidgetState extends State<OrderLocationWidget> {
  bool _openLocation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${AppLocalizations.of(context)!.translate(AppStrings.deliveredToText)} ",
              style: Theme.of(context).textTheme.headline5,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    _openLocation = !_openLocation;
                  });
                },
                child: Image.asset(ImageAssets.message))
          ],
        ),
        const SizedBox(height: 20),
        AnimatedContainer(
          width: double.infinity,
          height: _openLocation ? 100 : 0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey)),
          duration: const Duration(milliseconds: 200),
          child: Text("     ${widget.orderDetails.address!.name}",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: AppColors.secondary)),
        ),
      ],
    );
  }
}
