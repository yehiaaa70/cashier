import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class CustomAlert {
  static Alert alert({title, desc, context}) {
    return Alert(
      onWillPopActive: true,
      content: TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 40.0),
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
      context: context,
      title: title,
      buttons: [
        DialogButton(
          color: AppColors.red,
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: Text(
            "Cancel",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: AppColors.white),
          ),
        ),
        DialogButton(
          border: Border.all(width: 1, color: AppColors.red),
          color: AppColors.transparent,
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: Text(
            "Reject",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: AppColors.red),
          ),
        ),
      ],
    );
  }
}
