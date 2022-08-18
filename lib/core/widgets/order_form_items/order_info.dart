import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/core/utils/assets_manager.dart';
import 'package:cashir/core/utils/convert_numbers_method.dart';
import 'package:cashir/core/widgets/order_item_details.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../features/home_navigator/domain/entities/order_date.dart';
import '../../utils/app_colors.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo(
      {Key? key,
      required this.customerName,
      required this.customerPhone,
      required this.email,
      required this.items})
      : super(key: key);

  final String customerName;
  final String customerPhone;
  final String email;
  final List<Items> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 18,),
            Text(
              customerName,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: AppColors.darkBlue),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.phone),
            SizedBox(width: 18,),
            Text(
              AppLocalizations.of(context)!.isEnLocale
                  ? customerPhone
                  : replaceToArabicNumber(customerPhone),
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: AppColors.darkBlue, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            // Spacer(),
            InkWell(
              onTap: () async {
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: customerPhone,
                );
                await launchUrl(launchUri);
                // customerPhone.isNotEmpty? launch("tel://$customerPhone"):launch("tel://00112233445566");
              },
              child: Image.asset(ImageAssets.callIcon,
                  width: 25, height: 25, fit: BoxFit.fill),
            )
          ],
        ),
        Row(
          children: [
            Icon(Icons.email_outlined),
            SizedBox(width: 18,),
            Text(
              email,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: AppColors.darkBlue, fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ...List.generate(
          items.length,
          (index) => OrderItemDetails(items: items[index]),
        ),
      ],
    );
  }
}
