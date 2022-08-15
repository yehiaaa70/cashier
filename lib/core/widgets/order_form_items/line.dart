import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class NewLine extends StatelessWidget {
  const NewLine({Key? key, this.padding=0}) : super(key: key);
final double? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding??0.0),
      width: MediaQuery.of(context).size.width-padding!,
      height: 1,
      color: AppColors.grey,
    );
  }
}
