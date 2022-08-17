
import 'package:cashir/features/order_progress/domain/entities/complete_order.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/secure_storage/secure_storage.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_navigator/data/models/acceptor_model.dart';
import '../../../home_navigator/domain/entities/acceptor.dart';
import '../models/completed_model.dart';

abstract class BaseCompletedOrderRemoteDataSource{
  Future<Completed> putCompleted(int id);
}

class CompletedOrderRemoteDataSource extends BaseCompletedOrderRemoteDataSource{
  final BaseApiConsumer apiConsumer;

  CompletedOrderRemoteDataSource(this.apiConsumer);
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
  Future<Completed> putCompleted(int id) async {
    if (await getTokenBool() == true) {
      final response = await apiConsumer.put(EndPoints.orderState(id,"complete"),
          options: Options(
            headers: {
              "authorization":
              "Bearer $s",
            },
          ));
      return CompletedModel.fromJson(response);
    } else {
      return CompletedModel(
          data: CompletedData.empty(), message: "", success: false);
    }

  }
}