class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
      caseSensitive: false,
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email (e.g., user@example.com)';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    return null;
  }

  static String? validateRetypePassword(
    String? value,
    String? originalPassword,
  ) {
    if (value == null || value.isEmpty) {
      return 'Retype Password is required';
    }

    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    final passwordValidation = validatePassword(value);
    if (passwordValidation != null) return passwordValidation;

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      if (value == null || value.isEmpty) {
        return 'Name is required';
      }

      final trimmedValue = value.trim();
      if (trimmedValue.length < 3) {
        if (value.length < 3) {
          return 'Name must be at least 3 characters';
        }

        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmedValue)) {
          return 'Name must contain only alphabets and spaces';
        }

        return null;
      }
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number (10-15 digits)';
    }

    return null;
  }
  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }

    final otpRegex = RegExp(r'^\d{6}$');

    if (!otpRegex.hasMatch(value)) {
      return 'Enter a valid OTP (6 digits)';
    }

    if (value.length != 6) {
      return 'OTP must be 6 digits';
    }

    return null;
  }
}
