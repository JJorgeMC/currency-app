import 'package:currency_app/conversions_list.dart';
import 'package:currency_app/new_conversion.dart';
import 'package:flutter/material.dart';

class ConversionsScreen extends StatelessWidget {
  const ConversionsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jorge Maquera'),
      ),
      body: Column(
        children: [
          NewConversion(),
          Expanded(child: ConversionsList()),
        ],
      ),
    );
  }
}
