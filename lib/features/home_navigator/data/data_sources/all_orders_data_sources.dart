
import 'package:cashir/features/home_navigator/data/models/all_orders.dart';
import 'package:cashir/features/home_navigator/domain/entities/all_orders.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseAllOrdersRemoteDataSource {
  Future<AllCustomerOrders> getAllOrders();
  Future<AllCustomerOrders> getHistoryOrders();
}

class AllOrdersRemoteDataSource implements BaseAllOrdersRemoteDataSource {
  final BaseApiConsumer apiConsumer;

  AllOrdersRemoteDataSource({required this.apiConsumer});

  @override
  Future<AllCustomerOrders> getAllOrders() async {
    final response = await apiConsumer.get(EndPoints.allTodayOrders,
        options: Options(
          headers: {
            "authorization":
                "Bearer ${AppStrings.token}",
          },
        ));
    return AllOrdersModel.fromJson(response);
  }

  @override
  Future<AllCustomerOrders> getHistoryOrders() async {
    final response = await apiConsumer.get(EndPoints.allHistoryOrders,
        options: Options(
          headers: {
            "authorization":
            "Bearer ${AppStrings.token}",
          },
        ));
    return AllOrdersModel.fromJson(response);
  }
}
