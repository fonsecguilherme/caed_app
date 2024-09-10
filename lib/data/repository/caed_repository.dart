import 'dart:io';

import 'package:caed_app/data/models/data_model.dart';

import '../http_client.dart';

abstract class ICaedRepository {
  Future<Data?> fetchData();
}

class CaedRepository extends ICaedRepository {
  final IHttpClient client;

  CaedRepository({required this.client});

  @override
  Future<Data?> fetchData() async {
    const url = 'https://mocki.io/v1/66acb7fa-5328-4d6e-9776-a8788f963e9c';
    try {
      final response = await client.get(url: url);

      switch (response.statusCode) {
        case HttpStatus.ok:
          final result = Data.fromJson(response.body);

          return result;

        case HttpStatus.badRequest:
          throw Exception('Bad request: ${response.statusCode}');

        case HttpStatus.notFound:
          throw Exception('Failed to find the url. ${response.statusCode}');

        case HttpStatus.internalServerError:
          throw Exception('Internal server error. ${response.statusCode}');

        default:
          throw Exception('Failed to load locations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
