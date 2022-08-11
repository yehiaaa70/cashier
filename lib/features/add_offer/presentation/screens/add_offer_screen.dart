import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/app_bar_widget.dart';

class AddOfferScreen extends StatelessWidget {
  const AddOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Add Offers",
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: AppColors.darkBlue),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 12),
            child: InkWell(
              onTap: () {},
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications_none_outlined,
                    color: AppColors.darkBlue,
                    size: 35,
                  ),
                  Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.darkPurple),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text("Coupon Code", style: Theme.of(context).textTheme.headline5),
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
              Text("Coupon Details",
                  style: Theme.of(context).textTheme.headline5),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                    fillColor: AppColors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
                onSaved: (value) {},
              ),
              const SizedBox(height: 30),
              Text("Validity", style: Theme.of(context).textTheme.headline5),
              const SizedBox(height: 10),
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: const Text("From"),
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: const Text("To"),
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.darkPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text("Add Offer",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: AppColors.white))),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
