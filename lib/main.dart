import 'package:flutter/material.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HYOMIN CHOI (Flutter Developer Portfolio)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
