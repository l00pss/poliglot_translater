import 'package:flutter/material.dart';
import 'package:poliglot_translater/screens/export_screens.dart';
import 'package:poliglot_translater/utilities/ThemeFormat.dart';
import 'package:provider/provider.dart';
void main() => runApp(
    ChangeNotifierProvider<ThemeFormat>(
        create: (BuildContext context) => ThemeFormat(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poliglot',
      theme: Provider.of<ThemeFormat>(context).currentTheme,
      home: HomePanel(),
    );
  }
}
