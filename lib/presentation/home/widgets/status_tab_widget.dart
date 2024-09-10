import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/home/home_export.dart';
import '../../../data/models/data_model.dart';

class StatusTabWidget extends StatelessWidget {
  const StatusTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);

    return GridView.builder(
      itemCount: Condition.values.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cubit.colorPicker(
                  Condition.values.elementAt(index),
                ),
              ),
              height: 15,
              width: 15,
            ),
            const SizedBox(height: 8),
            Text(
              cubit.translateStatus(
                Condition.values.elementAt(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
