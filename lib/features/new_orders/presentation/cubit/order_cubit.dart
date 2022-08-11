import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderNew(state: 0));

  int get getState => state.state;

  void getOrderState(int i) {
    if (i == 0) {
      emit(const OrderNew(state: 0));
    } else if (i == 1) {
      emit(const OrderProgress(state: 1));
    } else {
      emit(const OrderCompleted(state: 2));
    }
  }
}
