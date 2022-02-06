import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/home_screen.dart';
import 'package:flutter_portfolio/state_provider.dart';
import 'package:flutter_portfolio/styles/styles.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StateProvider(),
      child: MaterialApp(
        title: 'Iliyass Zamouri',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Styles.materialColor),
        home: const HomeScreen(),
      ),
    );
  }
}
