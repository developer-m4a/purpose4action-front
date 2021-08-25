import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purpose4action/infrastructure/base/theme.dart';
import 'package:purpose4action/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purpose4Action',
      theme: purpose4actionTheme,
      onGenerateRoute: (settings) => onGenerateRoutes(settings),
      initialRoute: '/home'
    );
  }
}