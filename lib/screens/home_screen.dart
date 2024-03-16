import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      child: const Text(
        'Home Screen',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black
        ),
      ),
    );
  }
}