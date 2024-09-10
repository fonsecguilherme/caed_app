import 'dart:convert';

import 'package:caed_app/data/models/data_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should parse Data model correctly fromJson', () async {
    final Data data = Data.fromMap(_jsonDataMock);

    expect(data.packagesMissing, 440);
    expect(data.packagesMissingReturn, 440);
    expect(data.packagesReceived, 1560);
    expect(data.packagesReturned, 1560);

    expect(data.packages.first.id, "160500003517-85");
    expect(data.packages.first.data, "Sem dados disponíveis no momento.");
  });

  test('It should parse DataModel correctly toJson', () async {
    final data = _datamock.toJson();

    const expectedJson = _jsonDataMock as Map<String, dynamic>;

    final actualJson = jsonDecode(data) as Map<String, dynamic>;

    expect(actualJson, equals(expectedJson));
  });
}

Data _datamock = Data(
  packagesReceived: 1560,
  packagesMissing: 440,
  packagesReturned: 1560,
  packagesMissingReturn: 440,
  packages: [
    Package(
        id: "160500003517-85",
        data: "Sem dados disponíveis no momento.",
        status: [
          Status(
            hour: '18:19',
            date: '31/08/2023',
            condition: Condition.received,
            message: 'Coordenador registrou recebimento deste pacote.',
          ),
          Status(
            hour: '18:19',
            date: '07/09/2023',
            condition: Condition.returned,
            message: 'Coordenador registrou devolução deste pacote.',
          ),
        ])
  ],
);

const _jsonDataMock = {
  "packages_received": 1560,
  "packages_missing": 440,
  "packages_returned": 1560,
  "packages_missing_return": 440,
  "packages": [
    {
      "id": "160500003517-85",
      "data": "Sem dados disponíveis no momento.",
      "status": [
        {
          "hour": "18:19",
          "date": "31/08/2023",
          "condition": "received",
          "message": "Coordenador registrou recebimento deste pacote."
        },
        {
          "hour": "18:19",
          "date": "07/09/2023",
          "condition": "returned",
          "message": "Coordenador registrou devolução deste pacote."
        }
      ]
    },
  ]
};
