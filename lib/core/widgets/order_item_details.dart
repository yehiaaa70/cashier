import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/core/utils/convert_numbers_method.dart';
import 'package:flutter/material.dart';

import '../../features/home_navigator/domain/entities/order_date.dart';
import 'item_details.dart';

class OrderItemDetails extends StatelessWidget {
  const OrderItemDetails({Key? key, required this.items}) : super(key: key);
  final Items items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.grey, width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: AppColors.secondary),
                      image: DecorationImage(
                          image: NetworkImage(items.image), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      children: [
                        ItemDescription(
                          title:
                              '${AppLocalizations.of(context)!.translate(AppStrings.nameText)} ',
                          details: AppLocalizations.of(context)!.isEnLocale
                              ? items.nameEn
                              : items.nameAr,
                        ),
                        ItemDescription(
                          title:
                              '${AppLocalizations.of(context)!.translate(AppStrings.priceText)} ',
                          details:
                              "${AppLocalizations.of(context)!.translate(AppStrings.srText)} ${AppLocalizations.of(context)!.isEnLocale ? items.price : replaceToArabicNumber(items.price)}",
                        ),
                        ItemDescription(
                          title:
                              '${AppLocalizations.of(context)!.translate(AppStrings.caloriesText)} ',
                          details: AppLocalizations.of(context)!.isEnLocale
                              ? items.calories
                              : replaceToArabicNumber(items.calories),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 1,
                    color: AppColors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (items.doughType.isEmpty) ...{
                Text(AppLocalizations.of(context)!
                    .translate(AppStrings.noDoughText)
                    .toString())
              } else ...{
                Row(
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.translate(AppStrings.doughTypeText)} ',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    ...List.generate(
                        items.doughType.length,
                        (index) => Text(AppLocalizations.of(context)!.isEnLocale
                            ? items.doughType[index].nameEn
                            : items.doughType[index].nameAr)),
                    const Spacer(),
                  ],
                )
              },
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 1,
                    color: AppColors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (items.extras.isEmpty) ...{
                Text(AppLocalizations.of(context)!
                    .translate(AppStrings.noExtraText)
                    .toString())
              } else ...{
                Text(
                  AppLocalizations.of(context)!
                      .translate(AppStrings.extraText)
                      .toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                ...List.generate(
                  items.extras.length,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "${AppLocalizations.of(context)!.translate(AppStrings.nameText).toString()} : ${items.extras[index].nameEn}"),
                      Text(
                          "${AppLocalizations.of(context)!.translate(AppStrings.priceText).toString()} : ${AppLocalizations.of(context)!.isEnLocale ? items.extras[index].price : replaceToArabicNumber(items.extras[index].price)}"),
                      Text(
                          "${AppLocalizations.of(context)!.translate(AppStrings.caloriesText).toString()} : ${AppLocalizations.of(context)!.isEnLocale ? items.extras[index].calories : replaceToArabicNumber(items.extras[index].calories)}"),
                    ],
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
