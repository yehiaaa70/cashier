
import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home_navigator/domain/entities/acceptor.dart';

abstract class BaseAcceptRepository{
  Future<Either<Failure, Acceptor>> putAccept(int id);
  Future<Either<Failure, Acceptor>> putCancel(OrderDetails order,String reason);
  Future<Either<Failure, Acceptor>> putRejected(OrderDetails order,String reason);
}