import 'package:json_annotation/json_annotation.dart';

import '../currency_model.dart';
part 'currency_response.g.dart';

@JsonSerializable()
class CurrencyResponse{

  final List<CurrencyModel>? data;

  CurrencyResponse({this.data});

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) => _$CurrencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
}