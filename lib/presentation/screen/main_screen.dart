import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Widget body;

  const MainScreen({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
