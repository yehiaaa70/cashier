import 'package:cashir/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/utils/assets_manager.dart';
import '../widgets/available_offer_widget.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Text(
          AppStrings.availableOffers,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: AppColors.darkBlue),
        ),
        const SizedBox(
          height: 15,
        ),
        ...List.generate(2, (index) => const AvailableOfferWidget()),
        const SizedBox(
          height: 30,
        ),
        Text(
          AppStrings.expiredOffers,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: AppColors.darkBlue),
        ),
        const SizedBox(
          height: 15,
        ),
        ...List.generate(1, (index) => const AvailableOfferWidget()),
      ],
    );
  }
}
