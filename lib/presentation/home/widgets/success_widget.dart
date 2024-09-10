import 'package:caed_app/business_logic/home/home_export.dart';
import 'package:flutter/material.dart';

import '../../../data/models/data_model.dart';
import 'container_package_info.dart';
import 'packages_tab_widget.dart';
import 'status_tab_widget.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
    required this.cubit,
    required this.data,
  });

  final HomeCubit cubit;
  final Data data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _TopView(
            cubit: cubit,
            data: data,
          ),
          _BottomView(
            data: data,
          )
        ],
      ),
    );
  }
}

class _TopView extends StatelessWidget {
  const _TopView({
    required this.cubit,
    required this.data,
  });

  final HomeCubit cubit;
  final Data data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 319,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ContainerPackageInfo(
            data: data,
            cubit: cubit,
            title: 'Recebimento de pacotes',
            title1Row: 'Recebidos',
            packagesAmount1Row: data.packagesReceived,
            title2Row: 'Faltantes',
            packagesAmount2Row: data.packagesMissing,
            totalPackagesAmount: data.packagesReceived + data.packagesMissing,
          ),
          ContainerPackageInfo(
            data: data,
            cubit: cubit,
            title: 'Devolução de pacotes',
            title1Row: 'Devolvidos',
            packagesAmount1Row: data.packagesReturned,
            title2Row: 'Faltantes',
            packagesAmount2Row: data.packagesMissingReturn,
            totalPackagesAmount:
                data.packagesReturned + data.packagesMissingReturn,
          )
        ],
      ),
    );
  }
}

class _BottomView extends StatelessWidget {
  final Data data;

  const _BottomView({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: 'Pacotes'),
                  Tab(text: 'Status'),
                  Tab(text: 'Dados'),
                ],
              ),
              SizedBox(
                height: 255,
                child: TabBarView(
                  children: [
                    PackagesTabWidget(packages: data.packages),
                    const StatusTabWidget(),
                    const Center(child: Text('Sem dados disponíveis.')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
