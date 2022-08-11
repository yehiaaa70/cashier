import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'tabbar_status_state.dart';

class TabBarStatusCubit extends Cubit<TabBarStatusState> {
  TabBarStatusCubit() : super(const TabBarStatusInitial(index: 0));

  int get getIndex => state.index;

  void setIndex(int index) {
    emit(TabBarStatusLoaded(index: index));
  }
}
