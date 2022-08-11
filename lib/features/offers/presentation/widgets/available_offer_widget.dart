import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';

class AvailableOfferWidget extends StatelessWidget {
  const AvailableOfferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      radius: const Radius.circular(10),
      color: AppColors.grey,
      strokeWidth: 1,
      dashPattern: const [10, 6],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppStrings.couponCode,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: AppColors.darkBlue, fontWeight: FontWeight.bold),
                ),
                Text(
                  "ZBS192",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: AppColors.darkBlue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "20% off on ₹500.00 above order.",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: AppColors.darkBlue),
            ),
            Text(
              "20% off on ₹500.00 above order.",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: AppColors.darkBlue),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Text(
                AppStrings.deactivate,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: AppColors.darkPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
