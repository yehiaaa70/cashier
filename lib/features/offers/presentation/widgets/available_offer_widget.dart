import 'dart:developer';

import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/features/offers/data/models/offers_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AvailableOfferWidget extends StatelessWidget {
  final int index;
  final List<OffersModel> offers;
  final int color;
  const AvailableOfferWidget({
    Key? key,
    required this.index,
    required this.offers,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // log(offersList.length.toString());
    // var offers = CallApiForOffers.availableOffers;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: DottedBorder(
        borderType: BorderType.RRect,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   AppStrings.couponCode,
                  //   style: Theme.of(context).textTheme.headline6?.copyWith(
                  //       color: AppColors.darkBlue, fontWeight: FontWeight.bold),
                  // ),
                  Text(
                    offers[index].title ?? '',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: AppColors.darkBlue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Text(
              //   "End in: ${offers[index].dateTo}",
              //   style: Theme.of(context)
              //       .textTheme
              //       .bodyText1
              //       ?.copyWith(color: AppColors.darkBlue),
              // ),
              Text(
                offers[index].descriptionAr ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.darkBlue),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
