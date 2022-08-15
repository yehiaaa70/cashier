import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class InProgressCheckbox extends StatelessWidget {
  const InProgressCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child:
                    Text("TRACK", style: Theme.of(context).textTheme.headline6),
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Column(children: [
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: AppColors.lightGreen,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Order placed",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text("June 2, 2021 at 7:00 PM",
                                  style: TextStyle(fontSize: 14)),
                            ]),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: AppColors.lightGreen,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Order placed",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text("June 2, 2021 at 7:00 PM",
                                  style: TextStyle(fontSize: 14)),
                            ])
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: AppColors.lightGreen,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Order placed",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text("June 2, 2021 at 7:00 PM",
                                  style: TextStyle(fontSize: 14)),
                            ])
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: AppColors.lightGreen,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Order placed",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text("June 2, 2021 at 7:00 PM",
                                  style: TextStyle(fontSize: 14)),
                            ]),
                      ],
                    )
                  ]),
                  Positioned(
                    top: 35,
                    left: 23,
                    child: Container(
                      color: AppColors.lightGreen,
                      width: 2,
                      height: 60,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 23,
                    child: Container(
                      color: AppColors.lightGreen,
                      width: 2,
                      height: 60,
                    ),
                  ),
                  Positioned(
                    top: 168,
                    left: 23,
                    child: Container(
                      color: AppColors.lightGreen,
                      width: 2,
                      height: 60,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
