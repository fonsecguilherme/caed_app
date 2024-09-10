import 'package:flutter/material.dart';

import '../../../business_logic/home/home_export.dart';
import '../../../data/models/data_model.dart';
import 'info_row.dart';

class ContainerPackageInfo extends StatelessWidget {
  final Data data;
  final HomeCubit cubit;
  final String title;
  final String title1Row;
  final String title2Row;
  final int packagesAmount1Row;
  final int packagesAmount2Row;
  final int totalPackagesAmount;

  const ContainerPackageInfo({
    super.key,
    required this.data,
    required this.cubit,
    required this.title,
    required this.packagesAmount1Row,
    required this.totalPackagesAmount,
    required this.packagesAmount2Row,
    required this.title1Row,
    required this.title2Row,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: Row(
                children: [
                  Flexible(
                    flex: cubit.calculateSize(
                      packagesAmount: packagesAmount1Row,
                      totalPackagesAmount: totalPackagesAmount,
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
                      totalPackagesAmount: totalPackagesAmount,
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
              title: title1Row,
              packageAmout: packagesAmount1Row,
              percentage: cubit.calculatePercentage(
                packagesAmount: packagesAmount1Row,
                totalPackagesAmount: totalPackagesAmount,
              ),
              color: Colors.cyan.shade100,
            ),
            InfoRow(
              title: title2Row,
              packageAmout: packagesAmount2Row,
              percentage: cubit.calculatePercentage(
                packagesAmount: packagesAmount2Row,
                totalPackagesAmount: totalPackagesAmount,
              ),
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
