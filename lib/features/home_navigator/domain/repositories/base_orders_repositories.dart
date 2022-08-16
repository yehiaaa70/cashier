
import 'package:cashir/features/home_navigator/domain/entities/all_orders.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class BaseOrderRepository {
  Future<Either<Failure, AllCustomerOrders>> getTodayOrders();
  Future<Either<Failure, AllCustomerOrders>> getHistoryOrders();
}