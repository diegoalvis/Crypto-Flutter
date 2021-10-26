import 'package:prueb_tecnica_cryptocurrency/data/model/currency_model.dart';

import '../../view_model.dart';

class HomeStatus extends ViewStatus {
  final String money;
  final List<CurrencyModel> listCripto;
  final bool isLoading;

  HomeStatus({
    required this.money,
    required this.listCripto,
    this.isLoading = false,
  });

  HomeStatus copyWith({
    String? money,
    List<CurrencyModel>? listCripto,
    bool? isLoading,
  }) {
    return HomeStatus(
      money: money ?? this.money,
      listCripto: listCripto ?? this.listCripto,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
