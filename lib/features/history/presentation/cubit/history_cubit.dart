import 'package:bloc/bloc.dart';
import 'package:cashir/features/home_navigator/domain/entities/all_orders.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_navigator/domain/entities/order_date.dart';
import '../../../home_navigator/domain/use_cases/get_history_orders.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.getHistoryOrderUseCase) : super(HistoryInitial());
  final GetHistoryOrderUseCase getHistoryOrderUseCase;


  List<OrderDetails> completedHistory = [];
  List<OrderDetails> canceledHistory = [];
  List<OrderDetails> rejectedHistory = [];
  List<OrderDetails> deliveryHistory = [];
  List<OrderDetails> takeAwayHistory = [];

  Future<void> getHistoryOrders() async {
    emit(HistoryLoading());
    Either<Failure, AllCustomerOrders> response =
    await getHistoryOrderUseCase(NoParams());
    emit(response.fold(
            (failure) =>
            HistoryError(message: _mapFailureToMessage(failure)),
            (orders) {
          completedHistory = orders.data
              .where((element) => element.state == "completed")
              .toList();
          canceledHistory = orders.data
              .where((element) => element.state == "canceled")
              .toList();
          rejectedHistory = orders.data
              .where((element) => element.state == "rejected")
              .toList();
          deliveryHistory = orders.data
              .where((element) => element.serviceType == "delivery")
              .toList()
              .where((element) => element.state == "completed")
              .toList();
          takeAwayHistory = orders.data
              .where((element) => element.serviceType == "takeaway")
              .toList()
              .where((element) => element.state == "completed")
              .toList();
          return HistoryLoaded(orders);
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
