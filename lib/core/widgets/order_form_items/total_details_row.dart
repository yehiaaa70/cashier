import 'package:flutter/material.dart';

class TotalDetails extends StatelessWidget {
  TotalDetails({Key? key, required this.title, required this.money})
      : super(key: key);
  final String title;
  final String money;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title :",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          "SR $money",
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
