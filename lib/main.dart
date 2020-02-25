import 'package:flutter/material.dart';
import 'package:productive/ui/home.dart';

void main() => runApp(ProductiveApp());

class ProductiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Product Sans',
      ),
      home: HomePage(),
    );
  }
}
