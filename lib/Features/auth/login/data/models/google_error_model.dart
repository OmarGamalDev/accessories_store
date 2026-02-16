class GoogleErrorModel {
  final int statusCode;
  final String message;
  final List<String> generalErrors;

  GoogleErrorModel({
    required this.statusCode,
    required this.message,
    required this.generalErrors,
  });

  factory GoogleErrorModel.fromJson(Map<String, dynamic> json) {
    // Extract general errors from the errors object
    List<String> extractedErrors = [];

    if (json['errors'] != null && json['errors'] is Map) {
      final errors = json['errors'] as Map<String, dynamic>;

      // Check for generalErrors array
      if (errors['generalErrors'] != null && errors['generalErrors'] is List) {
        extractedErrors.addAll(
          List<String>.from(errors['generalErrors'] as List),
        );
      }
    }

    return GoogleErrorModel(
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? 'An error occurred',
      generalErrors: extractedErrors.isNotEmpty
          ? extractedErrors
          : [json['message'] ?? 'An error occurred'],
    );
  }

  /// Get the first error message for display
  String get errorMessage {
    if (generalErrors.isNotEmpty) {
      return generalErrors.first;
    }
    return message;
  }

  /// Get all errors as a single string
  String get allErrorsAsString {
    if (generalErrors.isNotEmpty) {
      return generalErrors.join('\n');
    }
    return message;
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'errors': {'generalErrors': generalErrors},
    };
  }
}
