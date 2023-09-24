import 'package:flutter/material.dart';
import 'tabbar.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Tabbar(),
    );
  }
}
