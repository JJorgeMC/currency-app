import 'package:currency_app/conversion.dart';
import 'package:currency_app/conversions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionsList extends StatelessWidget {
  const ConversionsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 18);
    return Consumer<Conversions>(
      builder: (ctx, conversions, _) => ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: conversions.items.reversed
            .map((e) => Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${Currencies.codes[Currency.Peso]} ${e.amount.toStringAsFixed(2)}',
                            style: textStyle,
                          ),
                          Text(
                            '${Currencies.codes[e.currency]} ${e.convertedAmount.toStringAsFixed(2)}',
                            style: textStyle,
                          )
                        ],
                      ),
                    ),
                    Divider()
                  ],
                ))
            .toList(),
      ),
    );
  }
}
