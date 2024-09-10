import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:caed_app/business_logic/login/login_export.dart';
import 'package:caed_app/presentation/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

late LoginCubit loginCubit;

void main() {
  setUp(() => loginCubit = MockLoginCubit());

  tearDown(() => loginCubit.close());

  group('Should find correct widgets according to login page', () {
    testWidgets('Find loading state widget', (tester) async {
      when(() => loginCubit.state).thenReturn(LoadingLoginState());

      await _createWidget(tester);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Find initial state widgets', (tester) async {
      when(() => loginCubit.state).thenReturn(InitialLoginState());

      await _createWidget(tester);

      expect(find.byType(Image), findsExactly(2));
      expect(find.byType(TextField), findsExactly(2));
      expect(find.text('Entrar'), findsOneWidget);
    });
  });

  testWidgets('Should show error flushbar', (tester) async {
    await tester.runAsync(() async {
      tester.view.physicalSize = const Size(1080.0, 2160.0);

      final state = StreamController<LoginState>();

      whenListen(
        loginCubit,
        state.stream,
        initialState: InitialLoginState(),
      );

      await _createWidget(tester);

      state.add(ErrorLoginState(
        errorMessage: 'Parece que você esqueceu de preencher algum campo!',
      ));

      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        find.text(
          'Parece que você esqueceu de preencher algum campo!',
        ),
        findsOneWidget,
      );
    });
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider(
        create: (context) => loginCubit,
        child: const LoginPage(),
      ),
    ),
  );
}
