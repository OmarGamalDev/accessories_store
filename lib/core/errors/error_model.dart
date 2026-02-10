import 'package:accessories_store/core/network/api_constants.dart';

class ErrorModel {
  final int statusCode;
  final String message;
  final List<String> generalErrors;

  ErrorModel({
    required this.statusCode,
    required this.message,
    required this.generalErrors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusCode: jsonData[ApiKey.statusCode] ?? 0,
      message: jsonData['message'] ?? 'An error occurred',
      generalErrors: jsonData['errors']?['generalErrors'] != null
          ? List<String>.from(jsonData['errors']['generalErrors'])
          : [],
    );
  }

  String get errorMessage {
    if (generalErrors.isNotEmpty) {
      return generalErrors.first;
    }
    return message;
  }
}
