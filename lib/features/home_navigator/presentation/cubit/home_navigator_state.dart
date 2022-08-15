part of 'home_navigator_cubit.dart';

@immutable
abstract class HomeNavigatorState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeNavigatorInitial extends HomeNavigatorState {}

class AllOrdersLoading extends HomeNavigatorState {}

class AllOrdersLoaded extends HomeNavigatorState {
  final AllCustomerOrders allCustomerOrders;

   AllOrdersLoaded({required this.allCustomerOrders});

  @override
  List<Object> get props => [allCustomerOrders];
}

class AllOrdersError extends HomeNavigatorState {
  final String message;

   AllOrdersError({required this.message});

  @override
  List<Object> get props => [message];
}

class OrdersChanges extends HomeNavigatorState {}

