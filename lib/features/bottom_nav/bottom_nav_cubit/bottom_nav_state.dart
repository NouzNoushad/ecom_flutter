part of 'bottom_nav_cubit.dart';

class BottomNavState extends Equatable {
  const BottomNavState(this.selectedIndex);
  final int selectedIndex;

  BottomNavState copyWith({int? selectedIndex}) {
    return BottomNavState(selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object> get props => [selectedIndex];
}
