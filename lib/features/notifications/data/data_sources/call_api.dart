import 'dart:convert';
import 'dart:developer';
import 'package:cashir/core/secure_storage/secure_storage.dart';
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
    String? token;

    Future<bool> getTokenBool() async {
      token = await SecureStorage.getToken();
      if (token == null || token == '') {
        return false;
      } else {
        return true;
      }
    }

    if (await getTokenBool()) {
      try {
        var headers = {
          'Authorization': 'Bearer $token',
        };
        var respose = await http.get(
          Uri.parse('https://itrplanet.com/Kop/public/api/notifications/logs'),
          headers: headers,
        );

        if (respose.statusCode == 200) {
          log(respose.statusCode.toString());
          final data = json.decode(respose.body)['data'];
          log(data.toString());

          notifications = (data as List)
              .map((data) => NotificationModel.fromJson(data))
              .toList();
          earlierNotifications = [];
          newNotifications = [];

          for (int i = 0; i < notifications.length; i++) {
            if (DateTime.parse(notifications[i].createdAt!)
                    .difference(DateTime.now())
                    .inDays <
                30) {
              newNotifications.add(notifications[i]);
            }
            if (DateTime.parse(notifications[i].createdAt!)
                    .difference(DateTime.now())
                    .inDays >
                30) {
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
}
