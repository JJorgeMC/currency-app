import 'package:currency_app/conversions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './conversions_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Conversions(),
      child: MaterialApp(
        title: 'Currency App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ConversionsScreen(),
      ),
    );
  }
}
