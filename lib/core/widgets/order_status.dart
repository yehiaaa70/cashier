import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class OrderStatus extends StatelessWidget {
   OrderStatus({Key? key, required this.containerColor, required this.status}) : super(key: key);

  final Color containerColor;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: containerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          status,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
