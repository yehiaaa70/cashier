import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/order_button.dart';

class InProgressItem extends StatelessWidget {
   const InProgressItem({Key? key, required this.globalKey}) : super(key: key);
  final GlobalKey<FormState> globalKey ;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppStrings.rejectedReason,
            style: Theme.of(context).textTheme.headline6),
        TextFormField(
          decoration: InputDecoration(
              fillColor: AppColors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              return null;
            } else {
              return AppStrings.insertReason;
            }
          },
          onSaved: (value) {},
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.grey,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: OrderButton(
                  text: 'Rejected',
                  onClick: () {
                    if (globalKey.currentState!.validate()) {

                    }
                  },
                  textColor: AppColors.red,
                  buttonColor: AppColors.red,
                  radius: 25,
                )),
            const SizedBox(width: 8),
            Expanded(
                child: OrderButton(
                  text: 'Taken',
                  onClick: () {},
                  textColor: AppColors.white,
                  buttonColor: AppColors.darkGreen,
                  radius: 25,
                )),
          ],
        )
      ],
    );
  }
}
