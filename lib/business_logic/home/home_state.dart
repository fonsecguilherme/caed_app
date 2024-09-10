import '../../data/models/data_model.dart';

sealed class HomeState {}

final class InitialHomeState extends HomeState {}

final class LoadingHomeState extends HomeState {}

final class SuccessHomeState extends HomeState {
  final Data result;

  SuccessHomeState({required this.result});
}

final class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState({required this.errorMessage});
}
