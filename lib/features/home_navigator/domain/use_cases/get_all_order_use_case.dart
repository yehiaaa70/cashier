
import 'package:cashir/features/home_navigator/domain/entities/all_orders.dart';
import 'package:cashir/features/home_navigator/domain/repositories/base_orders_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetCustomerOrderUseCase implements UseCase<AllCustomerOrders, NoParams> {
  final BaseOrderRepository orderRepository;

  const GetCustomerOrderUseCase({ required this.orderRepository});

  @override
  Future<Either<Failure, AllCustomerOrders>> call(NoParams params) =>
      orderRepository.getAllCustomer();
}