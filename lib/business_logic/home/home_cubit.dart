import 'package:caed_app/business_logic/home/home_export.dart';
import 'package:caed_app/data/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/caed_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.repository}) : super(InitialHomeState());

  final ICaedRepository repository;

  Future<void> fetchData() async {
    emit(LoadingHomeState());

    try {
      final result = await repository.fetchData();

      if (result != null) {
        emit(SuccessHomeState(result: result));
      }
    } catch (e) {
      emit(ErrorHomeState(errorMessage: '$e'));
    }
  }

  int calculateSize({
    required int packagesAmount,
    required int totalPackagesAmount,
  }) {
    double decimalPercentage = (packagesAmount / totalPackagesAmount) * 10;

    int intPart = decimalPercentage.toInt();
    double decimal = decimalPercentage - intPart;

    int roundedValue;
    if (decimal > 0.51) {
      roundedValue = intPart + 1;
    } else {
      roundedValue = intPart;
    }

    String roundedStr = roundedValue.toString();
    int firstDigit = int.parse(roundedStr[0]);

    return firstDigit;
  }

  int calculatePercentage({
    required int packagesAmount,
    required int totalPackagesAmount,
  }) {
    double decimalPercentage = (packagesAmount / totalPackagesAmount) * 100;

    return decimalPercentage.toInt();
  }

  Color colorPicker(Condition condition) {
    switch (condition) {
      case Condition.received:
        return const Color(0xffAEF3FE);

      case Condition.returned:
        return const Color(0xff3656FF);
      case Condition.delivered:
        return Colors.green;
      case Condition.misplaced:
        return Colors.purple;
      case Condition.retained:
        return Colors.red.shade800;
      default:
        return Colors.black;
    }
  }

  String translateStatus(Condition condition) {
    return switch (condition) {
      Condition.received => 'Recebido',
      Condition.returned => 'Retornado',
      Condition.delivered => 'Entregue',
      Condition.misplaced => 'Extraviado',
      Condition.retained => 'Retido',
      Condition.none => 'Sem Status',
    };
  }
}
