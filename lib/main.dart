import 'package:accessories_store/Features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AccessoriesStore());
}

class AccessoriesStore extends StatelessWidget {
  const AccessoriesStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}

