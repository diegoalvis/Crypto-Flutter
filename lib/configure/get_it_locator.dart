import 'package:get_it/get_it.dart';
import 'package:prueb_tecnica_cryptocurrency/data/repository/interactor.dart';
import 'package:prueb_tecnica_cryptocurrency/data/repository/service/cripto_currency_service.dart';

import 'idt_route.dart';

GetIt locator = GetIt.instance;

void setUpLocator() async {
  // Proporciona una instancia unica del servicio.
  locator.registerSingleton<IdtRoute>(IdtRoute());
  locator.registerSingleton<ApiInteractor>(ApiInteractor());

  locator.registerSingleton<CriptoCurrencyService>(CriptoCurrencyService());
}
