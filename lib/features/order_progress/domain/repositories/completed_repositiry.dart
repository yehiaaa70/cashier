import 'package:cashir/features/order_progress/domain/entities/complete_order.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class BaseCompletedRepository{
  Future<Either<Failure, Completed>> putCompleted(int id);
}