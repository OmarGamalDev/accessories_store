/// App-wide constants
class AppConstants {
  AppConstants._(); // Private constructor

  // App Info
  static const String appName = 'Accessories Store';
  static const String appVersion = '1.0.0';

  // API Configuration
  static const int apiTimeout = 30000; // 30 seconds
  static const int maxRetries = 3;

  // Cache Configuration
  static const int cacheMaxAge = 7; // days
  static const int imageCacheMaxAge = 30; // days

  // Pagination
  static const int itemsPerPage = 20;
  static const int maxItemsPerPage = 50;

  // Animation Durations
  static const int shortAnimationDuration = 200; // milliseconds
  static const int mediumAnimationDuration = 300;
  static const int longAnimationDuration = 500;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const double defaultElevation = 2.0;

  // OnBoarding
  static const int onBoardingPagesCount = 2;
}
