
import 'package:cashir/features/order_progress/domain/entities/complete_order.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
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


  @override
  Future<Completed> putCompleted(int id) async {
    final response = await apiConsumer.put(EndPoints.orderState(id,"complete"),
        options: Options(
          headers: {
            "authorization":
            "Bearer ${AppStrings.token}",
          },
        ));
    return CompletedModel.fromJson(response);
  }
}