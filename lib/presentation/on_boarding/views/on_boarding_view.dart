import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/presentation/on_boarding/views/widgets/on_boarding_view_body.dart';
import 'package:movies_app/presentation/on_boarding/views_model/on_boarding_cubit.dart';
import 'package:movies_app/presentation/on_boarding/views_model/on_boarding_intent.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (_) =>
          getIt.get<OnboardingCubit>()
            ..doIntent(OnboardingInitializationIntent()),
      child: const Scaffold(
         body: SafeArea(child: OnboardingViewBody()),
      ),
    );
  }
}
