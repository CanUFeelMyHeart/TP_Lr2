import 'package:flutter/material.dart';
import 'package:shop/controllers.dart';
import 'package:shop/views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductView(controller: productController),
    );
  }
}
