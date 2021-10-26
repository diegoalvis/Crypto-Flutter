import 'package:flutter/material.dart';
import 'package:prueb_tecnica_cryptocurrency/data/model/currency_model.dart';
import 'package:prueb_tecnica_cryptocurrency/pages/widgets/coin_item.dart';

class DetailPage extends StatelessWidget {
  final CurrencyModel model;

  const DetailPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(model.name),
          ),
          body: Center(
              child: Hero(
            tag: model.nameid,
            child: Material(type: MaterialType.transparency, child: CoinItem(model: model)),
          ))),
    );
  }
}
