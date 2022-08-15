
import 'package:dio/dio.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_navigator/data/models/acceptor_model.dart';
import '../../../home_navigator/domain/entities/acceptor.dart';

abstract class BaseAcceptOrderRemoteDataSource{
  Future<Acceptor> putAccept(int id);
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
}