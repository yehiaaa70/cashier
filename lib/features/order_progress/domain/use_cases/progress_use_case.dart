import 'package:cashir/core/error/failures.dart';
import 'package:cashir/core/usecases/usecase.dart';
import 'package:cashir/features/new_orders/domain/repositories/base_accept_repositories.dart';
import 'package:cashir/features/order_progress/domain/entities/complete_order.dart';
import 'package:cashir/features/order_progress/domain/repositories/completed_repositiry.dart';
import 'package:dartz/dartz.dart';

import '../../../home_navigator/domain/entities/acceptor.dart';
import '../../../home_navigator/domain/entities/order_date.dart';

class CompletedOrdersUseCase implements UseCase<Completed, OrderDetails> {
  final BaseCompletedRepository baseCompletedRepository;

  CompletedOrdersUseCase(this.baseCompletedRepository);

  @override
  Future<Either<Failure, Completed>> call(OrderDetails params) =>
      baseCompletedRepository.putCompleted(params.id);
}
