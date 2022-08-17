import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({Key? key, required this.title, required this.details})
      : super(key: key);
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Spacer(),
        Text(
          "$title :",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Spacer(),
        Text(
          details,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(),
      ],
    );
  }
}
