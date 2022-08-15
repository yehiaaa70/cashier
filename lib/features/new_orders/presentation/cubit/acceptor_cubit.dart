import 'package:bloc/bloc.dart';
import 'package:cashir/features/new_orders/domain/use_cases/accept_order_use_case.dart';
import 'package:cashir/features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_navigator/domain/entities/acceptor.dart';
import '../../../home_navigator/domain/entities/order_date.dart';

part 'acceptor_state.dart';

class AcceptorCubit extends Cubit<AcceptorState> {
  AcceptorCubit(this.acceptOrdersUseCase, this.tabBarStatusCubit)
      : super(AcceptorInitial());

  final TabBarStatusCubit tabBarStatusCubit;
  final AcceptOrdersUseCase acceptOrdersUseCase;

  Future<void> acceptOrders(OrderDetails details) async {
    emit(AcceptorLoading());
    Either<Failure, Acceptor> response = await acceptOrdersUseCase(details);
    emit(response.fold(
        (failure) => AcceptorError(message: _mapFailureToMessage(failure)),
        (accept) {
          print("orderDetails");
          print(details.id);

          tabBarStatusCubit.progress.add(details);
          tabBarStatusCubit.pending.removeWhere((element) => element.id==details.id);
          tabBarStatusCubit.changeList();
      // tabBarStatusCubit.getAllOrders();

      return AcceptorLoaded(accept);
    }));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
