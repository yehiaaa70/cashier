part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  final int state;
  const OrderState({required this.state});
  @override
  List<Object> get props => [state];
}

class OrderInitial extends OrderState {
  const OrderInitial({required super.state});

  @override
  List<Object> get props => [state];
}

class OrderCompleted extends OrderState {
  const OrderCompleted({required super.state});

  @override
  List<Object> get props => [];
}

class OrderProgress extends OrderState {
  const OrderProgress({required super.state});

  @override
  List<Object> get props => [];
}

class OrderNew extends OrderState {
  const OrderNew({required super.state});

  @override
  List<Object> get props => [];
}
