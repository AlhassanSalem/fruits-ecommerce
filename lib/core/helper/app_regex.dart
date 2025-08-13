class AppRegex {

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$',
    );
    return passwordRegex.hasMatch(password);
  }

  /// Validates a name with the following criteria:
  /// - At least 8 characters long
  /// - Contains only letters and spaces
  /// -  only spaces are allowed between words
  /// Example: "John Doe", "Jane Smith"
  /// Returns true if the name is valid, false otherwise.
  static bool isValidName(String name) {
    final nameRegex = RegExp(
      r'^[a-zA-Z]+(?:\s[a-zA-Z]+){1,}$',
    );
    return nameRegex.hasMatch(name) && name.length >= 8;
  }
}