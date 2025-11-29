sealed class OnboardingIntent {
  const OnboardingIntent();
}

final class OnboardingInitializationIntent extends OnboardingIntent {
  const OnboardingInitializationIntent();
}

final class ChangePageIntent extends OnboardingIntent {
  final int pageIndex;
  const ChangePageIntent({required this.pageIndex});
}

final class MoveToNextPageIntent extends OnboardingIntent {
  const MoveToNextPageIntent();
}

final class MoveToBackPageIntent extends OnboardingIntent {
  const MoveToBackPageIntent();
}
