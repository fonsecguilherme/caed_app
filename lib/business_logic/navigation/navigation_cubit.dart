import 'package:caed_app/business_logic/navigation/navigation_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavBarItem.home, 0));

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.home:
        emit(const NavigationState(NavBarItem.home, 0));
        break;
      case NavBarItem.options:
        emit(const NavigationState(NavBarItem.options, 1));
        break;
      case NavBarItem.tutorial:
        emit(const NavigationState(NavBarItem.tutorial, 2));
        break;
    }
  }
}
