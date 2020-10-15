import 'package:flutter/foundation.dart';

import './conversion.dart';

class Conversions with ChangeNotifier {
  List<Conversion> _items = [];

  List<Conversion> get items {
    return [..._items];
  }

  double addConversion(double amount, Currency currency) {
    final conversion = Currencies.convert(amount: amount, currency: currency);
    _items.add(conversion);
    notifyListeners();
    return conversion.convertedAmount;
  }
}
