import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/secure_storage/secure_storage.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_navigator/data/models/acceptor_model.dart';
import '../../../home_navigator/domain/entities/acceptor.dart';

abstract class BaseAcceptOrderRemoteDataSource {
  Future<Acceptor> putAccept(int id);

  Future<Acceptor> putCancel(OrderDetails orderDetails, String reason);

  Future<Acceptor> putReject(OrderDetails orderDetails, String reason);
}

class AcceptOrderRemoteDataSource extends BaseAcceptOrderRemoteDataSource {
  final BaseApiConsumer apiConsumer;

  AcceptOrderRemoteDataSource(this.apiConsumer);

  String? s;

  Future<bool> getTokenBool() async {
    s = await SecureStorage.getToken();
    if (s == null || s == '') {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Acceptor> putAccept(int id) async {
    if (await getTokenBool() == true) {
      final response = await apiConsumer.put(EndPoints.orderState(id, "accept"),
          options: Options(
            headers: {
              "authorization": "Bearer $s",
            },
          ));
      return AcceptorModel.fromJson(response);
    } else {
      return AcceptorModel(
          data: DataAcceptor.empty(), message: "", success: false);
    }

  }

  @override
  Future<Acceptor> putCancel(OrderDetails orderDetails, String reason) async {
    if (await getTokenBool() == true) {
      final response =
      await apiConsumer.put(EndPoints.orderState(orderDetails.id, "cancel"),
          options: Options(
            headers: {
              "authorization": "Bearer $s",
            },
          ),
          body: {"cancellation_reason": reason});
      return AcceptorModel.fromJson(response);
    } else {
      return AcceptorModel(
          data: DataAcceptor.empty(), message: "", success: false);
    }

  }

  @override
  Future<Acceptor> putReject(OrderDetails orderDetails, String reason) async {
    if (await getTokenBool() == true) {
      final response =
      await apiConsumer.put(EndPoints.orderState(orderDetails.id, "reject"),
          options: Options(
            headers: {
              "authorization": "Bearer $s",
            },
          ),
          body: {"cancellation_reason": reason});
      return AcceptorModel.fromJson(response);
    } else {
      return AcceptorModel(
          data: DataAcceptor.empty(), message: "", success: false);
    }

  }
}
