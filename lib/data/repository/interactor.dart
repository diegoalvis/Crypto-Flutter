import 'package:prueb_tecnica_cryptocurrency/configure/get_it_locator.dart';
import 'package:prueb_tecnica_cryptocurrency/data/model/currency_model.dart';
import 'package:prueb_tecnica_cryptocurrency/data/model/response/currency_response.dart';
import 'package:prueb_tecnica_cryptocurrency/utils/idt_result.dart';

import 'service/cripto_currency_service.dart';

class ApiInteractor {
  //Puente para solicitar servicios

  Future<IdtResult<List<CurrencyModel>?>> getListCriptos() async {
    final response = await locator<CriptoCurrencyService>().getListCriptos();

    return response;
  }
}
