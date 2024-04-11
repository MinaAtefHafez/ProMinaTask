import 'package:flutter/material.dart';

final navigationKey = GlobalKey<NavigatorState>();

class CustomNavigator {
  static CustomNavigator instance = CustomNavigator();

  Future<void> pushNamed(String routeName, {Object? arguments}) async {
    await Navigator.pushNamed(navigationKey.currentContext!, routeName,
        arguments: arguments);
  }




  Future<void> pushNamedReplacement(String routeName,
      {Object? arguments}) async {
    await Navigator.pushReplacementNamed(
      navigationKey.currentContext!,
      routeName,
      arguments: arguments,
    );
  }

  Future<void> pushNamedRemoveUntil(String routeName,
      {Object? arguments}) async {
    await Navigator.pushNamedAndRemoveUntil(
        navigationKey.currentContext!,
        routeName,
        arguments: arguments,
        (route) => false);
  }

  Future<void> pop([int pop = 1]) async {
    for (int i = 0; i < pop; i++) {
      Navigator.pop(navigationKey.currentContext!);
    }
  }

  Future<void> popUntil() async {
    Navigator.popUntil(navigationKey.currentContext!, (route) => false);
  }
}
