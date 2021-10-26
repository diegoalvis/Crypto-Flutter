import 'package:flutter/material.dart';
import 'package:prueb_tecnica_cryptocurrency/data/model/currency_model.dart';

class CoinItem extends StatelessWidget {
  final CurrencyModel model;

  const CoinItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNegativeChange = model.percent_change_24h.contains("-");
    final baseName = model.nameid.toLowerCase();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(model.symbol, style: TextStyle(fontSize: 20)),
                    SizedBox(width: 4),
                    Text("[${model.name}]", style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 4),
                    SizedBox(
                      // fuente de iconos https://github.com/ErikThiart/cryptocurrency-icons/tree/master/icons
                      child: Image.network(
                        "https://raw.githubusercontent.com/ErikThiart/cryptocurrency-icons/master/icons/$baseName.png",
                        height: 20,
                        fit: BoxFit.cover,
                        errorBuilder: (context, exception, stackTrace) {
                          // TODO Poner image de placeholder
                          return SizedBox(height: 20, width: 20,);
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("\$ ${model.price_usd}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 16),
                    Text(
                      "${model.percent_change_24h}%",
                      style: TextStyle(color: isNegativeChange ? Colors.redAccent : Colors.lightGreen),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
