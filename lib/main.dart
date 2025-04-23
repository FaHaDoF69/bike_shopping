import 'package:bike_shopping/pages/home.dart';
import 'package:bike_shopping/provider/mycard.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
      return  Cardd();
      },
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Home()),
    );
  }
}
