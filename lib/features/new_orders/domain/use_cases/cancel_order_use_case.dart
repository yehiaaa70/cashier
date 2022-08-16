import 'package:cashir/core/error/failures.dart';
import 'package:cashir/core/usecases/usecase.dart';
import 'package:cashir/features/new_orders/domain/repositories/base_accept_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../home_navigator/domain/entities/acceptor.dart';
import '../../../home_navigator/domain/entities/order_date.dart';
import '../entities/cancel_model_use_case.dart';

class CancelOrdersUseCase implements UseCase<Acceptor, CancelModel> {
  final BaseAcceptRepository baseAcceptRepository;

  CancelOrdersUseCase(this.baseAcceptRepository);

  @override
  Future<Either<Failure, Acceptor>> call(CancelModel params) =>
      baseAcceptRepository.putCancel(params.orderDetails, params.reason);
}
