class LoginSuccessModel {
  final String accessToken;
  final String expiresAtUtc;
  final String refreshToken;

  LoginSuccessModel({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) {
    return LoginSuccessModel(
      accessToken: json['accessToken'] ?? '',
      expiresAtUtc: json['expiresAtUtc'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'expiresAtUtc': expiresAtUtc,
      'refreshToken': refreshToken,
    };
  }
}