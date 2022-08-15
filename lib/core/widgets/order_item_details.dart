import 'package:cashir/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../features/home_navigator/domain/entities/order_date.dart';
import 'item_details.dart';

class OrderItemDetails extends StatelessWidget {
  const OrderItemDetails({Key? key, required this.items}) : super(key: key);
  final Items items;

  @override
  Widget build(BuildContext context) {
    // if(items.doughType.isEmpty)print(""),

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
                          title: 'Name ',
                          details: items.nameEn,
                        ),
                        ItemDescription(
                          title: 'Price ',
                          details: "SR ${items.price}",
                        ),
                        ItemDescription(
                          title: 'Calories ',
                          details: items.calories,
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
              Text(
                "Extras",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              if (items.extras.isEmpty) ...{
                const Text("No Extras")
              } else ...{
                ...List.generate(
                  items.extras.length,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name : ${items.extras[index].nameEn}"),
                      Text("Price : ${items.extras[index].price}"),
                      Text("Calories : ${items.extras[index].calories}"),
                    ],
                  ),
                ),
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
              Text(
                "Dough type",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              if (items.doughType.isEmpty) ...{
                const Text("No Dough Type")
              } else ...{
                ...List.generate(
                  items.doughType.length,
                  (index) => Text("Name : ${items.doughType[index].nameEn}"),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
