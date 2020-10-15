import 'package:flutter/foundation.dart';

enum Currency {
  Dolar,
  Euro,
  Yen,
  Peso,
}

class Currencies {
  static const dolar = 3.862;
  static const euro = 4.535;
  static const yen = 36.64;
  static Map<Currency, String> codes = {
    Currency.Dolar: 'USD',
    Currency.Euro: 'EUR',
    Currency.Yen: 'JPY',
    Currency.Peso: 'COP',
  };

  static Conversion convert({
    double amount,
    Currency currency,
  }) {
    switch (currency) {
      case Currency.Dolar:
        return Conversion(
          currency: currency,
          amount: amount,
          convertedAmount: amount * dolar,
        );
      case Currency.Euro:
        return Conversion(
          currency: currency,
          amount: amount,
          convertedAmount: amount * euro,
        );
      case Currency.Yen:
        return Conversion(
          currency: currency,
          amount: amount,
          convertedAmount: amount * yen,
        );
      default:
        return null;
    }
  }
}

class Conversion {
  final Currency currency;
  final double amount;
  final double convertedAmount;

  const Conversion({
    @required this.currency,
    @required this.amount,
    @required this.convertedAmount,
  });
}
