import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Future pushReplacementNamed(String routeName, {dynamic arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future pushNamed(String routeName, {dynamic arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pop() {
    return Navigator.of(this).pop();
  }

  Future pushAndRemoveUntil(String routeName, {required RoutePredicate predicate, dynamic arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments
    );
  }
  
  
  /// To show a error snackbar
  void errorSnackBar({
    required String message,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  /// To show a success snackbar
  void successSnackBar({
    required String message,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}


// Extension to center a widget
extension CenteredExtension on Widget {
  Widget centered() {
    return Center(child: this);
  }
}



extension StringExtension on String? {

  /// Checks if the string is null or empty.
  bool get isNullOrEmpty => this == null || this == '';
}