import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class AddOfferScreen extends StatelessWidget {
  const AddOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Text("Coupon Details", style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              fillColor: AppColors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none)),
          onSaved: (value) {},
        ),
        const SizedBox(height: 30),
        Container(
          height: 200,
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
            onSaved: (value) {},
          ),
        ),
        const SizedBox(height: 30),
        Text("Validity", style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 10),
        Row(
          children: [
            Text("Validity", style: Theme.of(context).textTheme.headline6),
          ],
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text("Add Offer",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: AppColors.white))),
          ),
        ),
      ],
    );
  }
}
