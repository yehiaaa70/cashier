part of 'home_navigator_cubit.dart';

@immutable
abstract class HomeNavigatorState extends Equatable {
  final TabItem currentTab;

  const HomeNavigatorState({required this.currentTab});

  @override
  List<Object> get props => [currentTab];
}

class HomeNavigatorInitial extends HomeNavigatorState {
  const HomeNavigatorInitial({required super.currentTab});
}

class HomeNavigatorLoaded extends HomeNavigatorState {
  const HomeNavigatorLoaded({required super.currentTab});
}
