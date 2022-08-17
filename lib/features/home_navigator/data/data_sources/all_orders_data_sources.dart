import 'package:cashir/features/home_navigator/data/models/all_orders.dart';
import 'package:cashir/features/home_navigator/domain/entities/all_orders.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/secure_storage/secure_storage.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../offers/presentation/cubit/offers_cubit.dart';

abstract class BaseAllOrdersRemoteDataSource {
  Future<AllCustomerOrders> getAllOrders();

  Future<AllCustomerOrders> getHistoryOrders();
}

class AllOrdersRemoteDataSource implements BaseAllOrdersRemoteDataSource {
  final BaseApiConsumer apiConsumer;

  AllOrdersRemoteDataSource({required this.apiConsumer});
  String? s;
  Future<bool> getTokenBool() async {
     s = await SecureStorage.getToken();
    if (s==null||s=='') {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<AllCustomerOrders> getAllOrders() async {
    if (await getTokenBool() == true) {
      final response = await apiConsumer.get(EndPoints.allTodayOrders,
          options: Options(
            headers: {
              'Authorization': 'Bearer $s',
            },
          ));
      return AllOrdersModel.fromJson(response);
    } else {
      return const AllCustomerOrders(success: false, data: [], message: '');
    }
  }

  @override
  Future<AllCustomerOrders> getHistoryOrders() async {
    if (await getTokenBool() == true) {
      print(s);
      final response = await apiConsumer.get(EndPoints.allHistoryOrders,
          options: Options(
            headers: {
              "authorization": "Bearer $s",
            },
          ));
      return AllOrdersModel.fromJson(response);
    } else {
      print(s);
      print(" noooooot doooone");

      return const AllCustomerOrders(success: false, data: [], message: '');
    }
  }
}
