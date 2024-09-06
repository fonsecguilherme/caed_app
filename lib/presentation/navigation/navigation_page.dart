import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/navigation/navigation_export.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  static const navigationBarStarIcon = Key('navigationBarStarIcon');

  @override
  State<NavigationPage> createState() => _RootPageState();
}

class _RootPageState extends State<NavigationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        bottomNavigationBar: const _BottomNaVigationBarWidget(),
        body: BlocProvider(
          create: (context) => NavigationCubit(),
          child: SafeArea(child: _body()),
        ),
      ),
    );
  }

  Widget _body() => BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navBarItem == NavBarItem.home) {
            return Container(
              color: Colors.green,
              child: const Text('gui'),
            );
          } else if (state.navBarItem == NavBarItem.options) {
            return Container(
              color: Colors.blue,
              child: const Text('text'),
            );
          } else if (state.navBarItem == NavBarItem.tutorial) {
            return Container(
              color: Colors.red,
              child: const Text('text'),
            );
          }
          return const SizedBox();
        },
      );
}

class _BottomNaVigationBarWidget extends StatelessWidget {
  const _BottomNaVigationBarWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return NavigationBar(
          animationDuration: const Duration(seconds: 1),
          elevation: 1,
          selectedIndex: state.index,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.settings),
              label: 'Opções',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.info_circle_fill),
              label: 'Tutoriais',
            ),
          ],
          onDestinationSelected: (index) {
            if (index == 0) {
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavBarItem.home);
            } else if (index == 1) {
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavBarItem.options);
            } else if (index == 2) {
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavBarItem.tutorial);
            }
          },
        );
      },
    );
  }
}
