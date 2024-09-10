import 'package:bloc_test/bloc_test.dart';
import 'package:caed_app/business_logic/navigation/navigation_export.dart';

void main() {
  blocTest<NavigationCubit, NavigationState>(
    'Navigate to home page',
    build: () => NavigationCubit(),
    act: (cubit) => cubit.getNavBarItem(NavBarItem.home),
    expect: () => const <NavigationState>[
      NavigationState(NavBarItem.home, 0),
    ],
  );

  blocTest<NavigationCubit, NavigationState>(
    'Navigate to options page',
    build: () => NavigationCubit(),
    act: (cubit) => cubit.getNavBarItem(NavBarItem.options),
    expect: () => const <NavigationState>[
      NavigationState(NavBarItem.options, 1),
    ],
  );

  blocTest<NavigationCubit, NavigationState>(
    'Navigate to tutorials page',
    build: () => NavigationCubit(),
    act: (cubit) => cubit.getNavBarItem(NavBarItem.tutorial),
    expect: () => const <NavigationState>[
      NavigationState(NavBarItem.tutorial, 2),
    ],
  );
}
