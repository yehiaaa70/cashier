import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';
import 'package:cashir/features/new_orders/presentation/cubit/acceptor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../config/local/app_localizations.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class CustomAlert {
  static Alert alert(
      {title,
      context,
      required OrderDetails orderDetails,
      cubitContext,
      required String state}) {
    GlobalKey<FormState> globalKey = GlobalKey();
    TextEditingController reasonController = TextEditingController();

    return Alert(
      style: AlertStyle(
          titleStyle: TextStyle(
              color: AppColors.red, fontSize: 25, fontWeight: FontWeight.bold),
          descStyle: TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold)),
      padding: EdgeInsets.all(25),
      onWillPopActive: true,
      content: Form(
        key: globalKey,
        child: Column(
          children: [
            SizedBox(height: 30),
            // Text("The Reason",style: Theme.of(context).textTheme.headline4,),
            TextFormField(
              maxLines: 10,
              minLines: 3,
              controller: reasonController,
              decoration: InputDecoration(
                  labelText: "The Reason",
                  // contentPadding: const EdgeInsets.symmetric(vertical: 50.0),
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
            SizedBox(height: 10),
          ],
        ),
      ),
      context: context,
      title: state == "pending"
          ? title
          : AppLocalizations.of(context)!
              .translate(AppStrings.alertMessageProgress)
              .toString(),
      desc: state == "pending"
          ? AppLocalizations.of(context)!
              .translate(AppStrings.alertHintPending)
              .toString()
          : AppLocalizations.of(context)!
              .translate(AppStrings.alertHintProgress)
              .toString(),
      buttons: [
        DialogButton(
          color: AppColors.red,
          onPressed: () {
            if (globalKey.currentState!.validate()) {
              BlocProvider.of<AcceptorCubit>(cubitContext)
                  .cancelOrders(orderDetails, reasonController.text, state);
              Navigator.pop(context);
            }
          },
          width: 120,
          child: Text(
            AppLocalizations.of(context)!
                .translate(AppStrings.cancelButton)
                .toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
        ),
        if (state == "pending")
          DialogButton(
            border: Border.all(width: 1, color: AppColors.red),
            color: AppColors.transparent,
            onPressed: () {
              if (globalKey.currentState!.validate()) {
                BlocProvider.of<AcceptorCubit>(cubitContext)
                    .rejectOrders(orderDetails, reasonController.text);
                Navigator.pop(context);
              }
            },
            width: 120,
            child: Text(
              AppLocalizations.of(context)!
                  .translate(AppStrings.rejectButton)
                  .toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: AppColors.red, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
