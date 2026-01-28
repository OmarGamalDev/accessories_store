class EndPoint {
  static String baseUrl = "https://api-coffee.ebdaa-business.com/api/";
  static String createUser = "auth/user/register";
  static String verifyEmail = "auth/user/verifyEmail";
  static String login = "auth/user/login";
  static String loginAdmin = "auth/admin/login";
  static String signUp = "user/signup";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String errorMessage = "detail";
  static String fullName = "fullname";
  static String email = "email";
  static String username = "username";
  static String phone = "phone";
  static String password = "password";
  static String image = "image";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
}
