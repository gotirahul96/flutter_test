import 'package:flutter/material.dart';
import 'package:testapp/animation_Screen.dart';
import 'package:testapp/counter/counter_page.dart';
import 'package:testapp/login_Screen.dart';

import 'counter/counter_view.dart';

void main() {
  runApp(const MyApp());

  final a = CounterView();
  a.fly();
  a.swim();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
