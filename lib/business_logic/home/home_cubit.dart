import 'package:caed_app/business_logic/home/home_export.dart';
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
}
