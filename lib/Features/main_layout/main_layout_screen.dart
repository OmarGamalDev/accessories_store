import 'package:accessories_store/Features/cart/presentation/view/cart_screen.dart';
import 'package:accessories_store/Features/home/presentation/view/home_screen.dart';
import 'package:accessories_store/Features/my_account/presentation/view/my_account_screen.dart';
import 'package:accessories_store/Features/products/presentation/view/products_screen.dart';
import 'package:accessories_store/Features/main_layout/custom_buttom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    ProductsScreen(),
    CartScreen(),
    MyAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: CustomButtomNavBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
