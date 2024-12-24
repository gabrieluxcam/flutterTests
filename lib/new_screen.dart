import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Screen'),
      ),
      body: Center(
        child: const Text(
          'Welcome to the New Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
