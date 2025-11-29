import 'package:flutter/material.dart';
import 'package:movies_app/core/router/route_names.dart';
import 'package:movies_app/presentation/on_boarding/views/on_boarding_view.dart';

  abstract final class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      default:
        return null;
    }
  }
}