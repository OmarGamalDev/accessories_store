class RegisterSuccessModel {
  final String message;

  RegisterSuccessModel({required this.message});

  factory RegisterSuccessModel.fromJson(Map<String, dynamic> json) {
    return RegisterSuccessModel(
      message: json['message'] ?? 'Registration successful',
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
