import 'package:accessories_store/Features/auth/login/presentation/view/login_view.dart';
import 'package:accessories_store/Features/auth/register/presentation/view/register_view.dart';
import 'package:accessories_store/Features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:accessories_store/Features/splash/presentation/view/splash_view.dart';
import 'package:accessories_store/core/routes/app_routes.dart';
import 'package:accessories_store/features/about_us/presentation/view/about_us_screen.dart';
import 'package:accessories_store/features/auth/forgot_password/presentation/view/forgot_password_screen.dart';
import 'package:accessories_store/features/auth/new_password/presentation/view/new_password_screen.dart';
import 'package:accessories_store/features/auth/verify_otp/presentation/view/verify_otp_screen.dart';
import 'package:accessories_store/features/best_selling/presentation/view/best_selling_screen.dart';
import 'package:accessories_store/features/cart/presentation/view/cart_screen.dart';
import 'package:accessories_store/features/checkout/presentation/view/checkout_screen.dart';
import 'package:accessories_store/features/favorite/presentation/view/favorite_screen.dart';
import 'package:accessories_store/features/home/presentation/view/home_screen.dart';
import 'package:accessories_store/features/item_product_detail/presentation/view/item_product_detail_screen.dart';
import 'package:accessories_store/features/my_account/presentation/view/my_account_screen.dart';
import 'package:accessories_store/features/my_orders/presentation/view/my_orders_screen.dart';
import 'package:accessories_store/features/my_profile/presentation/view/my_profile_screen.dart';
import 'package:accessories_store/features/notification/presentation/view/notification_screen.dart';
import 'package:accessories_store/features/order_tracking/presentation/view/order_tracking_screen.dart';
import 'package:accessories_store/features/payments/presentation/view/payments_screen.dart';
import 'package:accessories_store/features/products/presentation/view/products_screen.dart';
import 'package:accessories_store/features/review/presentation/view/review_screen.dart';
import 'package:accessories_store/features/search/presentation/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_colors.dart';

class RouterGenerationConfig {
  static GoRouter routerConfig = GoRouter(
    initialLocation: AppRoutes.forgotPasswordScreen,
    errorBuilder: (context, state) {
      return errorBuilder();
    },
    routes: [
      /// Onboarding
      GoRoute(
        path: AppRoutes.onboardingScreen,
        name: AppRoutes.onboardingScreen,
        builder: (context, state) => OnBoardingView(),
      ),

      /// Splash
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => SplashView(),
      ),

      /// Login
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => LoginView(),
      ),

      /// Register
      GoRoute(
        path: AppRoutes.registerScreen,
        name: AppRoutes.registerScreen,
        builder: (context, state) => RegisterView(),
      ),

      /// Forgot Password
      GoRoute(
        path: AppRoutes.forgotPasswordScreen,
        name: AppRoutes.forgotPasswordScreen,
        builder: (context, state) => ForgotPasswordScreen(),
      ),

      /// New Password
      GoRoute(
        path: AppRoutes.newPasswordScreen,
        name: AppRoutes.newPasswordScreen,
        builder: (context, state) => NewPasswordScreen(),
      ),

      /// verify Otp
      GoRoute(
        path: AppRoutes.verifyOtpScreen,
        name: AppRoutes.verifyOtpScreen,
        builder: (context, state) => VerifyOtpScreen(),
      ),

      /// About Us
      GoRoute(
        path: AppRoutes.aboutUsScreen,
        name: AppRoutes.aboutUsScreen,
        builder: (context, state) => AboutUsScreen(),
      ),

      /// Best Selling
      GoRoute(
        path: AppRoutes.bestSellingScreen,
        name: AppRoutes.bestSellingScreen,
        builder: (context, state) => BestSellingScreen(),
      ),

      /// Cart
      GoRoute(
        path: AppRoutes.cartScreen,
        name: AppRoutes.cartScreen,
        builder: (context, state) => CartScreen(),
      ),

      /// Checkout
      GoRoute(
        path: AppRoutes.checkoutScreen,
        name: AppRoutes.checkoutScreen,
        builder: (context, state) => CheckoutScreen(),
      ),

      /// Favorite
      GoRoute(
        path: AppRoutes.favoriteScreen,
        name: AppRoutes.favoriteScreen,
        builder: (context, state) => FavoriteScreen(),
      ),

      /// Home
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),

      /// Item Product
      GoRoute(
        path: AppRoutes.itemProductDetailScreen,
        name: AppRoutes.itemProductDetailScreen,
        builder: (context, state) => ItemProductDetailScreen(),
      ),

      /// My Account
      GoRoute(
        path: AppRoutes.myAccountScreen,
        name: AppRoutes.myAccountScreen,
        builder: (context, state) => MyAccountScreen(),
      ),

      /// My Orders
      GoRoute(
        path: AppRoutes.myOrdersScreen,
        name: AppRoutes.myOrdersScreen,
        builder: (context, state) => MyOrdersScreen(),
      ),

      /// My Profile
      GoRoute(
        path: AppRoutes.myProfileScreen,
        name: AppRoutes.myProfileScreen,
        builder: (context, state) => MyProfileScreen(),
      ),

      /// Notification
      GoRoute(
        path: AppRoutes.notificationScreen,
        name: AppRoutes.notificationScreen,
        builder: (context, state) => NotificationScreen(),
      ),

      /// Order Tracking
      GoRoute(
        path: AppRoutes.orderTrackingScreen,
        name: AppRoutes.orderTrackingScreen,
        builder: (context, state) => OrderTrackingScreen(),
      ),

      /// Payments
      GoRoute(
        path: AppRoutes.paymentsScreen,
        name: AppRoutes.paymentsScreen,
        builder: (context, state) => PaymentsScreen(),
      ),

      /// Products
      GoRoute(
        path: AppRoutes.productsScreen,
        name: AppRoutes.productsScreen,
        builder: (context, state) => ProductsScreen(),
      ),

      /// Review
      GoRoute(
        path: AppRoutes.reviewScreen,
        name: AppRoutes.reviewScreen,
        builder: (context, state) => ReviewScreen(),
      ),

      /// Search
      GoRoute(
        path: AppRoutes.searchScreen,
        name: AppRoutes.searchScreen,
        builder: (context, state) => SearchScreen(),
      ),
    ],
  );
}

Widget errorBuilder() {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: AppColors.redColor,
      title: Text("Error Screen"),
    ),
    body: Center(child: Text("No Page Found")),
  );
}
