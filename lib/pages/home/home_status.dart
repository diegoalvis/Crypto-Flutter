import 'package:prueb_tecnica_cryptocurrency/data/model/currency_model.dart';

import '../../view_model.dart';

class HomeStatus extends ViewStatus {
  final String money;
  final List<CurrencyModel> listCripto;

  HomeStatus({
    required this.money,
    required this.listCripto,
  });

  HomeStatus copyWith({
    String? money,
    List<CurrencyModel>? listCriptoResponse,
  }) {
  return HomeStatus(
  money: money ?? this.money,
  listCripto: listCriptoResponse ?? this.listCripto);
  }
}
