import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/app_strings.dart';
import '../screens/home_navigator_screen.dart';
import '../widgets/home_navigation_item.dart';

part 'home_navigator_state.dart';

class HomeNavigatorCubit extends Cubit<HomeNavigatorState> {
  HomeNavigatorCubit()
      : super(const HomeNavigatorInitial(currentTab: TabItem.Orders));

  TabItem get getCurrentTab => state.currentTab;

  void setCurrentTab(TabItem tabItem) {
    emit(HomeNavigatorLoaded(currentTab: tabItem));
  }
}
