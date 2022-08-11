import 'package:cashir/core/utils/assets_manager.dart';
import 'package:cashir/core/widgets/order_status.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class OrderCompletedItem extends StatelessWidget {
   OrderCompletedItem({Key? key}) : super(key: key);
  List<String> orderItems = ["1x Pizza","2x Pepsi","3x "];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Customer Name\n',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      TextSpan(
                        text: '+123456789',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 22,),
                    Text("210.00\$",style: Theme.of(context).textTheme.headline2,),
                    OrderStatus(containerColor: AppColors.darkGreen, status: "Completed"),
                  ],
                ),
              ],
            ),
            ...List.generate(
              orderItems.length,
                  (index) => Text(
                orderItems[index],
                style: Theme.of(context).textTheme.headline6,
              ),
            ),

            SizedBox(height: 8),
            Text("COMPLETED ON",style: Theme.of(context).textTheme.headline4,),
            Text("June 2, 2021 at 7:00 PM",style: Theme.of(context).textTheme.bodyText1,),
            SizedBox(height: 20),
            Container(width: double.infinity-20,
            height: 1,
            color: AppColors.grey,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(children: [
                Text("Rated",style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold),),
                Row(children: [
                  Image.asset(ImageAssets.smileEmoji),
                  SizedBox(width: 8),
                  Text("Satisfiled",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),)
                ],)
              ],),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Image.asset(ImageAssets.callIcon),
              )
            ],)


          ],
        ),
      ),
    );
  }
}
