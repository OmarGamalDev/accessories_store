import 'package:flutter/material.dart';

void main() {
  runApp(const AccessoriesStore());
}

class AccessoriesStore extends StatelessWidget {
  const AccessoriesStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: Center(
          child: Text('Welcome to the Accessories Store!'),
        ),
      ),
    );  
  }
}

