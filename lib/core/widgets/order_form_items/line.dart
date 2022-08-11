import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class NewLine extends StatelessWidget {
  const NewLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppColors.grey,
    );
  }
}
