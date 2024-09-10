import 'package:caed_app/business_logic/home/home_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/data_model.dart';
import '../../package_detail/package_detail_page.dart';

class PackagesTabWidget extends StatefulWidget {
  const PackagesTabWidget({super.key, required this.packages});

  final List<Package> packages;

  @override
  State<PackagesTabWidget> createState() => _PackagesTabWidgetState();
}

class _PackagesTabWidgetState extends State<PackagesTabWidget> {
  HomeCubit get cubit => context.read<HomeCubit>();
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
          widget.packages.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final package = widget.packages.elementAt(index);

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: cubit,
                              child: PackageDetailPage(
                                package: package,
                              ),
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
                  itemCount: widget.packages.length,
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
