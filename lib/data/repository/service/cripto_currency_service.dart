import 'dart:convert';

import 'package:prueb_tecnica_cryptocurrency/data/model/currency_model.dart';
import 'package:prueb_tecnica_cryptocurrency/data/model/response/currency_response.dart';
import 'package:prueb_tecnica_cryptocurrency/utils/errors/currency_error.dart';
import 'package:prueb_tecnica_cryptocurrency/utils/idt_result.dart';
import 'package:http/http.dart' as http;

class CriptoCurrencyService {
  Future<IdtResult<List<CurrencyModel>?>> getListCriptos() async {
    String urlDominio = 'api.coinlore.net';
    final uri = Uri.https(urlDominio,'/api/tickers');

    final response = await http.get(uri);

    try {
      switch (response.statusCode) {
        case 200:
          {
            final body = json.decode(response.body);
            final entity = CurrencyResponse.fromJson(body);

            return IdtResult.success(entity.data);
          }

        default:
          {
            final error = CurrencyError('Capturar el error', response.statusCode);

            return IdtResult.failure(error);
          }
      }
    } on StateError catch (err) {
      final error = CurrencyError(err.message, response.statusCode);

      return IdtResult.failure(error);
    }
  }
}
