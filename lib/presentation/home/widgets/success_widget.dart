import 'package:caed_app/business_logic/home/home_export.dart';
import 'package:caed_app/presentation/package_detail/package_detail_page.dart';
import 'package:flutter/material.dart';

import '../../../data/models/data_model.dart';
import 'info_row.dart';

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
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            left: 21.0,
            bottom: 16.0,
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            width: 339,
            decoration: BoxDecoration(
              color: const Color(0xf0f0f0f0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Recebimento de pacotes',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                  child: Row(
                    children: [
                      Flexible(
                        flex: cubit.calculateSize(
                          packagesAmount: data.packagesReceived,
                          totalPackagesAmount:
                              data.packagesReceived + data.packagesMissing,
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.cyan.shade100,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        flex: cubit.calculateSize(
                          packagesAmount: data.packagesMissing,
                          totalPackagesAmount:
                              data.packagesReceived + data.packagesMissing,
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                InfoRow(
                  packageAmout: data.packagesReceived,
                  percentage: cubit.calculatePercentage(
                      packagesAmount: data.packagesReceived,
                      totalPackagesAmount:
                          data.packagesReceived + data.packagesMissing),
                  color: Colors.cyan.shade100,
                ),
                InfoRow(
                  packageAmout: data.packagesMissing,
                  percentage: cubit.calculatePercentage(
                      packagesAmount: data.packagesMissing,
                      totalPackagesAmount:
                          data.packagesReceived + data.packagesMissing),
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Flexible(
        flex: 4,
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
                    _PackagesListing(data.packages),
                    const Icon(Icons.directions_transit),
                    const Icon(Icons.directions_bike),
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

class _PackagesListing extends StatelessWidget {
  const _PackagesListing(this.packages);

  final List<Package> packages;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.filter_list,
                  size: 32,
                ),
                const SizedBox(width: 8.0),
                Text(
                  'Lista de pacotes',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          const Divider(),
          packages.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final package = packages.elementAt(index);

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PackageDetailPage(
                              package: package,
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(package.id),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 10,
                    color: Colors.grey,
                  ),
                  itemCount: packages.length,
                )
              : const Expanded(
                  child: Center(
                    child: Text('Nenhum pacote adicionado'),
                  ),
                ),
        ],
      ),
    );
  }
}
