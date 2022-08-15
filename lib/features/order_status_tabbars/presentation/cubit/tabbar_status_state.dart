part of 'tabbar_status_cubit.dart';

abstract class TabBarStatusState extends Equatable {
  const TabBarStatusState();

  @override
  List<Object?> get props => [];
}

class TabBarStatusInitial extends TabBarStatusState {}

class TabBarStatusLoaded extends TabBarStatusState {}

class AllOrdersInitial extends TabBarStatusState {}

class AllOrdersLoading extends TabBarStatusState {}
class OrdersChanges extends TabBarStatusState {}

class AllOrdersLoaded extends TabBarStatusState {
  final AllCustomerOrders allCustomerOrders;

  const AllOrdersLoaded({required this.allCustomerOrders});

  @override
  List<Object?> get props => [allCustomerOrders];
}

class AllOrdersError extends TabBarStatusState {
  final String message;

  const AllOrdersError({required this.message});

  @override
  List<Object> get props => [message];
}
