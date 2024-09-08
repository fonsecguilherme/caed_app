// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:caed_app/business_logic/home/home_export.dart';
import 'package:caed_app/data/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/info_row.dart';
import 'widgets/success_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit get cubit => context.read<HomeCubit>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final currentState = cubit.state;
    if (currentState is InitialHomeState) {
      cubit.fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Pacotes'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state) {
            case LoadingHomeState():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case SuccessHomeState():
              return SuccessWidget(
                cubit: cubit,
                data: state.result,
              );

            case ErrorHomeState():
              return Center(
                child: Text(state.errorMessage),
              );
            default:
              return const Text('default');
          }
        },
      ),
    );
  }
}

