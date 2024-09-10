import 'package:caed_app/data/repository/caed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCaedRepository extends Mock implements CaedRepository {}

late CaedRepository repository;

void main() {
  setUp(() => repository = MockCaedRepository());

  tearDown(() => repository);

  test('Fetch api data', () async {
    try {
      await repository.fetchData();
    } catch (_) {}
    verify(() => repository.fetchData()).called(1);
  });

  group('Error tests', () {
    test('Throw exception when http istatus is 400', () async {
      final exception = Exception('Bad request: 400}');

      when(() => repository.fetchData()).thenThrow(exception);

      expect(() async => repository.fetchData(), throwsA(exception));
    });
    test('Throw exception when http istatus is 404', () async {
      final exception = Exception('Failed to find the url. 404');

      when(() => repository.fetchData()).thenThrow(exception);

      expect(() async => repository.fetchData(), throwsA(exception));
    });
    test('Throw exception when http istatus is 500', () async {
      final exception = Exception('Bad request: 500}');

      when(() => repository.fetchData()).thenThrow(exception);

      expect(() async => repository.fetchData(), throwsA(exception));
    });
  });
}
