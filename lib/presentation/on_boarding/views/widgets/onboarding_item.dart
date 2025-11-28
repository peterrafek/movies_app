import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constanse/app_colors.dart';
import 'package:movies_app/domain/entities/onboarding/onboarding_entity.dart';
import 'package:movies_app/presentation/on_boarding/views_model/on_boarding_cubit.dart';
import 'package:movies_app/presentation/on_boarding/views_model/on_boarding_intent.dart';
import 'package:movies_app/utiles/commen_widgets/custom_elevated_button.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingEntity entity;
  final int index;

  const OnboardingItem({super.key, required this.entity, required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnboardingCubit>(context);
    final theme = Theme.of(context);
    final isLast = index == cubit.state.onboardingList.length - 1;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(entity.onboardingImage, fit: BoxFit.cover),

        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                entity.title.tr(),
                style: theme.textTheme.headlineLarge,
                // const TextStyle(
                //     color: Colors.white,
                //     fontSize: 26,
                //     fontWeight:
                //     FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              if (entity.subTitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    entity.subTitle!.tr(),
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 20),

              // Buttons

               Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isLast)
                    CustomElevatedButton(
                      onPressed: () => cubit.doIntent(MoveToNextPageIntent()),
                      buttonTitle: "Finish",
                    ),

                  if (index == 0)
                    CustomElevatedButton(
                      onPressed: () => cubit.doIntent(MoveToNextPageIntent()),
                      buttonTitle: "Explore Now",
                    ),

                  if (index != 0 && index != 5)
                    CustomElevatedButton(
                      onPressed: () => cubit.doIntent(MoveToNextPageIntent()),
                      buttonTitle: "next",
                    ),

                  if (index != 0)
                    CustomElevatedButton(
                      backgroundColor: AppColors.black,
                      borderColor: theme.colorScheme.primary,
                      onPressed: () => cubit.doIntent(MoveToBackPageIntent()),
                      buttonTitle: "Back",
                      titleStyle:  TextStyle(color: theme.colorScheme.primary),
                    ),

                  //   ElevatedButton(
                  //   onPressed: () => cubit.doIntent(MoveToNextPageIntent()),
                  //   child: Text(isLast ? "Finish" : "Next"),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
