import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/assets_manager.dart';

class OrderLocationWidget extends StatefulWidget {
  const OrderLocationWidget({Key? key}) : super(key: key);

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
              "Delivered To ",
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
          height: _openLocation ? 200 : 0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey)),
          duration: const Duration(milliseconds: 100),
          child: Text("Address",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: AppColors.grey)),
        ),
      ],
    );
  }
}
