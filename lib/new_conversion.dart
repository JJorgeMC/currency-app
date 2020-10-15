import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './conversion.dart';
import './conversions.dart';

class NewConversion extends StatefulWidget {
  NewConversion({Key key}) : super(key: key);

  @override
  _NewConversionState createState() => _NewConversionState();
}

class _NewConversionState extends State<NewConversion> {
  final amountController = TextEditingController();

  var convertedAmountDisplayed = 0.0;
  var currencyDisplayed = '';

  Widget _buildCurrencyButton(Currency currency) {
    final currencyName = Currencies.codes[currency];
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        final amountValue = amountController.text;
        if (amountValue.isEmpty) return;
        final amount = double.parse(amountValue);
        final convertedAmount = Provider.of<Conversions>(context, listen: false)
            .addConversion(amount, currency);
        setState(() {
          currencyDisplayed = currencyName;
          convertedAmountDisplayed = convertedAmount;
        });
        // amountController.text = '';
      },
      child: Text(currencyName),
      textColor: Theme.of(context).canvasColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 18);

    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              'Badge Conversor',
              style: Theme.of(context).textTheme.headline5,
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCurrencyButton(Currency.Dolar),
                _buildCurrencyButton(Currency.Euro),
                _buildCurrencyButton(Currency.Yen),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Currency: $currencyDisplayed', style: textStyle),
                Text(
                    'Equivalence: ${convertedAmountDisplayed.toStringAsFixed(2)}',
                    style: textStyle),
              ],
            ),
            SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
