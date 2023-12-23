import 'package:flutter/material.dart';
import 'package:products/pages/laza.dart';
// import 'package:products/pages/products.dart';
// import 'package:products/pages/login.dart';
import 'package:products/model.dart';
// import 'package:products/service.dart';

Color dark_color = Colors.purple;
Color light_color = Color.fromARGB(255, 235, 150, 250);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartApp(),
    );
  }
}

color_value(String value) {
  if (value == 'Red') {
    dark_color = Color(0xFFFF0000);
    light_color = Color(0xFFFA8072);
  } else if (value == 'Blue') {
    dark_color = Color.fromARGB(255, 62, 62, 252);
    light_color = Color(0xFF87CEFA);
  } else if (value == 'Green') {
    dark_color = Color(0xFF008000);
    light_color = Color(0xFF98FB98);
  } else if (value == 'Orange') {
    dark_color = Color(0xFFFFA500);
    light_color = Color.fromARGB(255, 252, 234, 137);
  } else if (value == 'Defult') {
    dark_color = Color(0xFF74239e);
    light_color = Color(0xFFe2cced);
  } else if (value == 'Purple') {
    dark_color = Color(0xFF800080);
    light_color = Color(0xFFDDA0DD);
  } else if (value == 'Brown') {
    dark_color = Color(0xFFA0522D);
    light_color = Color(0xFFDEB887);
  }
}

List<ProductModel> list_favorait = [];
List<ProductModel> list_buying = [];
int total_Price = 0;
