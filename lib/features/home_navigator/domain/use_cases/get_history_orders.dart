
import 'package:cashir/features/home_navigator/domain/entities/all_orders.dart';
import 'package:cashir/features/home_navigator/domain/repositories/base_orders_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetHistoryOrderUseCase implements UseCase<AllCustomerOrders, NoParams> {
  final BaseOrderRepository orderRepository;

  const GetHistoryOrderUseCase({ required this.orderRepository});

  @override
  Future<Either<Failure, AllCustomerOrders>> call(NoParams params) =>
      orderRepository.getHistoryOrders();
}