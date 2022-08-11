import 'package:cashir/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onClick;
  final double radius;
  final Color buttonColor;

  const OrderButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    required this.onClick,
    this.radius = 6.0,
    this.buttonColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>( (buttonColor==AppColors.red||buttonColor==AppColors.primary)?AppColors.white:buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: (buttonColor==AppColors.red||buttonColor==AppColors.primary)
                ? BorderSide(
                    color: buttonColor,
                  )
                : BorderSide.none,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor,fontSize: 18),
      ),
    );
  }
}
