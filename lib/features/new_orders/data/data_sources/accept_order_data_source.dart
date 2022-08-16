
import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_navigator/data/models/acceptor_model.dart';
import '../../../home_navigator/domain/entities/acceptor.dart';

abstract class BaseAcceptOrderRemoteDataSource{
  Future<Acceptor> putAccept(int id);
  Future<Acceptor> putCancel(OrderDetails orderDetails,String reason);
  Future<Acceptor> putReject(OrderDetails orderDetails,String reason);
}

class AcceptOrderRemoteDataSource extends BaseAcceptOrderRemoteDataSource{
  final BaseApiConsumer apiConsumer;

  AcceptOrderRemoteDataSource(this.apiConsumer);

  @override
  Future<Acceptor> putAccept(int id) async {
    final response = await apiConsumer.put(EndPoints.orderState(id,"accept"),
        options: Options(
          headers: {
            "authorization":
            "Bearer ${AppStrings.token}",
          },
        ));
    return AcceptorModel.fromJson(response);
  }

  @override
  Future<Acceptor> putCancel(OrderDetails orderDetails,String reason) async {
    final response = await apiConsumer.put(EndPoints.orderState(orderDetails.id,"cancel"),
        options: Options(
          headers: {
            "authorization":
            "Bearer ${AppStrings.token}",
          },
        ),body: {
          "cancellation_reason": reason
        });
    return AcceptorModel.fromJson(response);
  }

  @override
  Future<Acceptor> putReject(OrderDetails orderDetails, String reason) async {
    final response = await apiConsumer.put(EndPoints.orderState(orderDetails.id,"reject"),
        options: Options(
          headers: {
            "authorization":
            "Bearer ${AppStrings.token}",
          },
        ),body: {
          "cancellation_reason": reason
        });
    return AcceptorModel.fromJson(response);
  }
}