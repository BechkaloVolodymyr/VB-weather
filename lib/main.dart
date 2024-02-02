import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/injector.dart';
import 'package:weather/presentation/view/home_page.dart';

void main() => runZonedGuarded(() async {
      configureDependencies();
      await Hive.initFlutter();
      runApp(const MyApp());
    }, (error, stack) {
      // Handles uncaught asynchronous errors
    });

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter weather',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
