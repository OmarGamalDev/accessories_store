class ErrorModel {
  final int statusCode;
  final String errorMessage;

  ErrorModel({required this.errorMessage, required this.statusCode});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusCode: jsonData["statusCode"],
      errorMessage: jsonData["message"],
    );
  }
}