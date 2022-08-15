
import 'package:cashir/core/error/failures.dart';
import 'package:cashir/core/usecases/usecase.dart';
import 'package:cashir/features/new_orders/domain/repositories/base_accept_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../home_navigator/domain/entities/acceptor.dart';
import '../../../home_navigator/domain/entities/order_date.dart';


class AcceptOrdersUseCase implements UseCase<Acceptor, OrderDetails>{
  final BaseAcceptRepository baseAcceptRepository;

  AcceptOrdersUseCase(this.baseAcceptRepository);
  @override
  Future<Either<Failure, Acceptor>> call(OrderDetails params) => baseAcceptRepository.putAccept(params.id);
}