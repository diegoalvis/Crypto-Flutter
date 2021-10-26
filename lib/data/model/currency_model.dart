import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel {
  final String symbol;
  final String name;
  final String nameid;
  final String price_usd;
  final String percent_change_24h;

  CurrencyModel(
    this.symbol,
    this.name,
    this.price_usd,
    this.percent_change_24h,
    this.nameid,
  );

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
