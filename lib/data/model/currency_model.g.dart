// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) {
  return CurrencyModel(
    json['symbol'] as String,
    json['name'] as String,
    json['price_usd'] as String,
    json['percent_change_24h'] as String,
    json['nameid'] as String,
  );
}

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'nameid': instance.nameid,
      'price_usd': instance.price_usd,
      'percent_change_24h': instance.percent_change_24h,
    };
