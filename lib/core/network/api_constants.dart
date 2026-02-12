class EndPoint {
  static String baseUrl = "https://accessories-eshop.runasp.net/";
  static String register = "api/auth/register";
  static String createUser = "api/auth/register";
  static String verifyEmail = "api/auth/verify-email";
  static String verifyOtp = "api/auth/validate-otp";
  static String login = "api/auth/login";
  static String refreshToken = "api/auth/refresh-token";
  static String forgotPassword = "api/auth/forgot-password";
  static String loginWithGoogle = "api/auth/google/login";
  static String resendOtp = "api/auth/resend-otp";
}

class ApiKey {
  static const String statusCode = "statusCode";
  static const String message = "message";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String email = "email";
  static const String username = "username";
  static const String phone = "phone";
  static const String password = "password";
  static const String image = "image";
  static const String token = "token";
  static const String id = "id";
  static const String name = "name";
  static const String confirmPassword = "confirmPassword";
  static const String location = "location";

  /// Authentication token prefix for Bearer-style authentication
  static const String tokenPrefix = "FOODAPI";
}
