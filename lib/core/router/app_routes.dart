import 'package:flutter/material.dart';
abstract final class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RouteNames.onboarding:
      //   return MaterialPageRoute(builder: (_) => const OnboardingView());
      default:
        return null;
    }
  }
}