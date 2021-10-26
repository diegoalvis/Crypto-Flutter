// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) {
  return CurrencyModel(
    symbol: json['symbol'] as String?,
    name: json['name'] as String?,
    price_usd: json['price_usd'] as String?,
    percent_change_24h: json['percent_change_24h'] as String?,
  );
}

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'price_usd': instance.price_usd,
      'percent_change_24h': instance.percent_change_24h,
    };
