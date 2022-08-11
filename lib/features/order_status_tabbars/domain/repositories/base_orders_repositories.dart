
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/all_orders.dart';


abstract class BaseOrderRepository {
  Future<Either<Failure, AllCustomerOrders>> getAllCustomer();
}