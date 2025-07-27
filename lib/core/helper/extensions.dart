import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
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
}

// Extension to center a widget
extension CenteredExtension on Widget {
  Widget centered() {
    return Center(child: this);
  }
}