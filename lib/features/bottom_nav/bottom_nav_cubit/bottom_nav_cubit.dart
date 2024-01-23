import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavState(0));

  int selectedIndex = 0;

  onTapBottomNavItem(int index) {
    selectedIndex = index;
    emit(state.copyWith(selectedIndex: selectedIndex));
  }
}
