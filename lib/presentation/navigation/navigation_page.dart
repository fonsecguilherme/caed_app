import 'package:caed_app/business_logic/home/home_cubit.dart';
import 'package:caed_app/data/repository/caed_repository.dart';
import 'package:caed_app/presentation/home/home_page.dart';
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
  Widget build(BuildContext context) {
    ICaedRepository repository = context.read<ICaedRepository>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            repository: repository,
          ),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: const Scaffold(
        bottomNavigationBar: _BottomNaVigationBarWidget(),
        body: SafeArea(
          child: _NavigationBuilder(),
        ),
      ),
    );
  }
}

class _NavigationBuilder extends StatelessWidget {
  const _NavigationBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        if (state.navBarItem == NavBarItem.home) {
          return const HomePage();
        } else if (state.navBarItem == NavBarItem.options) {
          return Container(
            color: Colors.green,
            child: const Text('opa'),
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
