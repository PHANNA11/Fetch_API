import 'package:flutter/material.dart';
import 'package:hello_world_app/products/view/product_screen.dart';
import 'package:hello_world_app/view/post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductScreen());
  }
}
