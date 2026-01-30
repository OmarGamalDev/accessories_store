import 'package:accessories_store/core/network/api_constants.dart';

class ErrorModel {
  final int statusCode;
  final String errorMessage;

  ErrorModel({required this.errorMessage, required this.statusCode});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusCode: jsonData[ApiKey.statusCode],
      errorMessage: jsonData[ApiKey.errorMessage],
    );
  }
}