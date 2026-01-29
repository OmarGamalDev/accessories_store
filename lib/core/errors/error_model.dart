import 'package:accessories_store/core/network/api_constants.dart';
class ErrorModel {
  final String errorMessage;

  ErrorModel({required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    final errorData = jsonData[ApiKey.errorMessage] ??
        jsonData["message"] ??
        jsonData["msg"] ??
        "Unknown error";

    return ErrorModel(errorMessage: errorData.toString());
  }
}