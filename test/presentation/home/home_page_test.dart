import 'package:bloc_test/bloc_test.dart';
import 'package:caed_app/business_logic/home/home_export.dart';
import 'package:caed_app/data/models/data_model.dart';
import 'package:caed_app/presentation/home/home_page.dart';
import 'package:caed_app/presentation/home/widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {
  @override
  int calculateSize(
      {required int packagesAmount, required int totalPackagesAmount}) {
    return 0; // Valor default
  }

  @override
  int calculatePercentage(
      {required int packagesAmount, required int totalPackagesAmount}) {
    return 0; // Valor default
  }
}

late HomeCubit homeCubit;

void main() {
  setUp(() {
    return homeCubit = MockHomeCubit();
  });

  tearDown(() => homeCubit.close());
  group('Should find correct widgets according to home page', () {
    testWidgets('Find loading state widget', (tester) async {
      when(() => homeCubit.state).thenReturn(LoadingHomeState());

      await _createWidget(tester);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Find success state widget', (tester) async {
      tester.view.physicalSize = const Size(1080.0, 2160.0);

      when(() => homeCubit.state)
          .thenReturn(SuccessHomeState(result: _datamock));

      await _createWidget(tester);

      expect(find.byType(SuccessWidget), findsWidgets);
    });

    testWidgets('Find error state widgets', (tester) async {
      when(() => homeCubit.state)
          .thenReturn(ErrorHomeState(errorMessage: 'Erro padrão'));

      await _createWidget(tester);

      expect(find.text('Erro padrão'), findsOneWidget);
    });
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => homeCubit,
          ),
        ],
        child: const HomePage(),
      ),
    ),
  );
}

Data _datamock = Data(
  packagesReceived: 1234,
  packagesMissing: 1234,
  packagesReturned: 1234,
  packagesMissingReturn: 1234,
  packages: [
    Package(id: '1234', data: 'conteudo', status: [
      Status(
        hour: 'hour',
        date: 'date',
        condition: Condition.delivered,
        message: 'message',
      )
    ])
  ],
);
