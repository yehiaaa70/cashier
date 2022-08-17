import 'dart:convert';
import 'dart:developer';
import 'package:cashir/features/notifications/data/models/notification_model.dart';
import 'package:cashir/features/offers/presentation/cubit/offers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CallApiForNotification {
  static List<NotificationModel> notifications = [];
  static List<NotificationModel> newNotifications = [];
  static List<NotificationModel> earlierNotifications = [];

  Future<void> getAppNotifications(context) async {
    log(OffersCubit.get(context).token.toString());

    try {
      var headers = {
        'Authorization': 'Bearer ${OffersCubit.get(context).token}',
        'Cookie':
            'XSRF-TOKEN=eyJpdiI6Inp0MFRCZTFFSWFocWs2S2RuXC93XC90QT09IiwidmFsdWUiOiJZajRDZUZ6SVFQbEJLU05jOXowZmx5Um1BUm9SUWNuRjJ1K2w5cWhGckd0MGhLQmtBZnppT0NYNVJCZUJUbUhCIiwibWFjIjoiZjQwZWI2Y2RkNmY4ZGNjMzBlYjk1YWMwOTQ5NDc5MmE0NWZiODE0YzI5ZGYxOTA3YTc0N2NhNGZkOGUzZWZhOSJ9; kop_session=Ro1RaKrOuWI5Ge1o7QuuwGmYfFoN2FuFbnTSQhEq'
      };
      var respose = await http.get(
        Uri.parse('https://itrplanet.com/Kop/public/api/notifications/logs'),
        headers: headers,
      );

      // log(notifications[0].title.toString());

      if (respose.statusCode == 200) {
        log(respose.statusCode.toString());
        final data = json.decode(respose.body)['data'];
        log(data.toString());

        notifications = (data as List)
            .map((data) => NotificationModel.fromJson(data))
            .toList();

        for (int i = 0; i < notifications.length; i++) {
          if (DateTime.parse(notifications[i].createdAt!)
                  .difference(DateTime.now())
                  .inHours <=
              3) {
            newNotifications.add(notifications[i]);
          }
          if (DateTime.parse(notifications[i].createdAt!)
                  .difference(DateTime.now())
                  .inHours >
              3) {
            earlierNotifications.add(notifications[i]);
          }
        }
      } else {
        log(respose.statusCode.toString());
        // log(respose.body.toString());
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
