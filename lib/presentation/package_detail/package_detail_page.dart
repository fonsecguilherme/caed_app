import 'package:caed_app/business_logic/home/home_cubit.dart';
import 'package:caed_app/data/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageDetailPage extends StatelessWidget {
  final Package package;

  const PackageDetailPage({
    super.key,
    required this.package,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacote: ${package.id}'),
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TabBar(
                    tabs: [
                      Tab(text: 'Status'),
                      Tab(text: 'Dados'),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    children: [
                      _StatusTab(
                        info: package.status,
                        cubit: cubit,
                      ),
                      const _DataTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusTab extends StatelessWidget {
  final List<Status> info;
  final HomeCubit cubit;

  const _StatusTab({required this.info, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status do pacote',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xf0f0f0f0),
            ),
            width: double.infinity,
            child: ListView.builder(
              itemCount: info.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text(
                        '${info.elementAt(index).date}\n${info.elementAt(index).hour}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cubit
                                .colorPicker(info.elementAt(index).condition),
                          ),
                          height: 15,
                          width: 15,
                        )),
                    Flexible(
                      flex: 6,
                      child: Text(
                        info.elementAt(index).message,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _DataTab extends StatelessWidget {
  const _DataTab() : super();

  @override
  Widget build(BuildContext context) => const Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Center(
              child: Text('Tela de dados'),
            ),
          ),
        ],
      );
}
