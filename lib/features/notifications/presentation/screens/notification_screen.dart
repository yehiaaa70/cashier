import 'dart:developer';

import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/core/secure_storage/secure_storage.dart';
import 'package:cashir/features/notifications/data/data_sources/call_api.dart';
import 'package:cashir/features/notifications/presentation/cubit/notification_cubit.dart';
import 'package:cashir/features/notifications/presentation/cubit/notification_state.dart';
import 'package:cashir/features/offers/presentation/cubit/offers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/notification_container_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    NotificationCubit.get(context).getAllNotifications(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationIsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    AppLocalizations.of(context)!
                        .translate(AppStrings.newNotification)
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    ...List.generate(
                        CallApiForNotification.newNotifications.length,
                        (index) => NotificationContainerWidget(
                              notification: CallApiForNotification
                                  .newNotifications[index],
                            )),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                      AppLocalizations.of(context)!
                          .translate(AppStrings.earlierNotification)
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
                ...List.generate(
                    CallApiForNotification.earlierNotifications.length,
                    (index) => NotificationContainerWidget(
                          notification: CallApiForNotification
                              .earlierNotifications[index],
                        ))
              ],
            ),
          );
        },
      ),
    );
  }
}
