import 'package:accessories_store/core/shared_widgets/app_snack_bar_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AccessoriesStore());
}

class AccessoriesStore extends StatelessWidget {
  const AccessoriesStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AppSnackBarExample(),
    );
  }
}

