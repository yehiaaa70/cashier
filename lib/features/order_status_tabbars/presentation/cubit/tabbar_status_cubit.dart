import 'package:bloc/bloc.dart';
import 'package:cashir/features/new_orders/domain/use_cases/accept_order_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_navigator/domain/entities/all_orders.dart';
import '../../../home_navigator/domain/entities/order_date.dart';
import '../../../home_navigator/domain/use_cases/get_all_order_use_case.dart';

part 'tabbar_status_state.dart';

class TabBarStatusCubit extends Cubit<TabBarStatusState> {
  TabBarStatusCubit(this.getCustomerOrderUseCase) : super(AllOrdersInitial());

  static TabBarStatusCubit get(context) => BlocProvider.of<TabBarStatusCubit>(context);


  final GetCustomerOrderUseCase getCustomerOrderUseCase;
  List<OrderDetails> pending = [];
  List<OrderDetails> progress = [];
  List<OrderDetails> completed = [];
  List<OrderDetails> canceled = [];
  List<OrderDetails> rejected = [];
  List<OrderDetails> delivery = [];
  List<OrderDetails> takeAway = [];

  Future<void> getAllOrders() async {
    emit(AllOrdersLoading());
    Either<Failure, AllCustomerOrders> response =
        await getCustomerOrderUseCase(NoParams());
    emit(response.fold(
        (failure) => AllOrdersError(message: _mapFailureToMessage(failure)),
        (orders) {
      pending = orders.data.data
          .where((element) => element.state == "pending")
          .toList();
      progress = orders.data.data
          .where((element) => element.state == "in-progress")
          .toList();
      completed = orders.data.data
          .where((element) => element.state == "completed")
          .toList();
      canceled = orders.data.data
          .where((element) => element.state == "canceled")
          .toList();
      rejected = orders.data.data
          .where((element) => element.state == "rejected")
          .toList();
      delivery = orders.data.data
          .where((element) => element.serviceType == "delivery")
          .toList().where((element) => element.state == "completed")
          .toList();
      takeAway = orders.data.data
          .where((element) => element.serviceType == "takeaway")
          .toList();
      return AllOrdersLoaded(allCustomerOrders: orders);
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

   changeList() {
    emit(OrdersChanges());
  }
}
