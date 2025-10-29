class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email address';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  static String? validateConfirmPassword(String? value, String? original) {
    if (value != original) return 'Passwords do not match';
    return null;
  }

  static String? validateNotEmpty(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) return '$fieldName is required';
    return null;
  }
}
