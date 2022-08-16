part of 'history_cubit.dart';

@immutable
abstract class HistoryState extends Equatable{
  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {}
class HistoryLoading extends HistoryState {}
class HistoryLoaded extends HistoryState {
  final AllCustomerOrders allCustomerOrders;

  HistoryLoaded(this.allCustomerOrders);
  @override
  List<Object?> get props => [allCustomerOrders];

}

class HistoryError extends HistoryState {
  final String message;

  HistoryError({required this.message});

  @override
  List<Object> get props => [message];
}

