import 'package:cashir/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OrdersStatusWidget extends StatelessWidget {
  const OrdersStatusWidget(
      {Key? key,
      required this.count,
      required this.text,
      required this.color,
      required this.showBottomLine})
      : super(key: key);
  final int count;
  final String text;
  final Color color;
  final bool showBottomLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RichText(
        //     text: TextSpan(children: [
        //   TextSpan(
        //     text: "${count.toString()}\n",
        //     style: Theme.of(context)
        //         .textTheme
        //         .headline1
        //         ?.copyWith(color: AppColors.darkPurple),
        //   ),
        //   TextSpan(
        //       text: text,
        //       style: Theme.of(context).textTheme.headline6?.copyWith(
        //             color: AppColors.darkPurple,
        //           ))
        // ])),
        Text(
          count.toString(),
          style: Theme.of(context).textTheme.headline1?.copyWith(color: color),
        ),
        Text(text,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: color,
                )),
        if (showBottomLine) ...{
          Container(
              width: (MediaQuery.of(context).size.width - 40) / 3,
              height: 2,
              color: AppColors.darkPurple)
        }
      ],
    );
  }
}
