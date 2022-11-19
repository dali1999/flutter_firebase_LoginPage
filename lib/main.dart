import 'package:candid/screens/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp()); // start app

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authpage(),
    );
  }
}
