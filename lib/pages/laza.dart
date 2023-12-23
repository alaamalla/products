import 'dart:async';

import 'package:flutter/material.dart';
import 'package:products/main.dart';
import 'package:products/pages/login.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  int c = 3;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark_color,
      body: Center(
        child: Text(
          'Laza',
          style: TextStyle(
              color: light_color, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }
}
