import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  OrderWidget({Key? key, required this.isDelivery}) : super(key: key);
  final bool isDelivery;
  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _openLocation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Container(
            //   width: 140,
            //   height: 35,
            //   decoration: BoxDecoration(
            //       color: widget.isDelivery
            //           ? AppColors.darkPurple
            //           : AppColors.orange,
            //       borderRadius: BorderRadius.circular(10)),
            //   child: Center(
            //       child: Text(
            //           widget.isDelivery
            //               ? AppStrings.delivery
            //               : AppStrings.takeaway,
            //           style: Theme.of(context)
            //               .textTheme
            //               .headline6
            //               ?.copyWith(color: AppColors.white))),
            // ),
            InkWell(
                onTap: () {
                  setState(() {
                    _openLocation = !_openLocation;
                  });
                },
                child: Image.asset(ImageAssets.message))
          ],
        ),
        const SizedBox(height: 10),
        AnimatedContainer(
          width: double.infinity,
          height: _openLocation ? 200 : 0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey)),
          duration: const Duration(milliseconds: 100),
          child: Text("Address",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: AppColors.grey)),
        ),
        const SizedBox(height: 20),
        Text(AppStrings.denyReason,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async {
                if (widget._globalKey.currentState!.validate()) {}
              },
              child: Container(
                width: 140,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.red)),
                child: Center(
                    child: Text(AppStrings.deny,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.red))),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 140,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                    child: Text(AppStrings.accept,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.white))),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
