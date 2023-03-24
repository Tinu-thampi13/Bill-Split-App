import 'package:bill_split/homescreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(bill_split());

class bill_split extends StatelessWidget {
  const bill_split({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homescreen(),
    );
  }
}
