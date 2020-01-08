import 'package:flutter/material.dart';
import './controllers/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

final RouteGenerator router = new RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: router.generateRoute,
    );
  }
}
