part of 'tabbar_status_cubit.dart';

abstract class TabBarStatusState extends Equatable {
  final int index;
  const TabBarStatusState({required this.index});
}

class TabBarStatusInitial extends TabBarStatusState {
  const TabBarStatusInitial({required super.index});

  @override
  List<Object> get props => [index];
}

class TabBarStatusLoaded extends TabBarStatusState {
  const TabBarStatusLoaded({required super.index});

  @override
  List<Object> get props => [index];
}
