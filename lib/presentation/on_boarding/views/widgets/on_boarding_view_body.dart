import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/router/route_names.dart';
import 'package:movies_app/presentation/on_boarding/views/widgets/onboarding_item.dart';
import 'package:movies_app/presentation/on_boarding/views_model/on_boarding_cubit.dart';
import 'package:movies_app/presentation/on_boarding/views_model/on_boarding_intent.dart';
import 'package:movies_app/presentation/on_boarding/views_model/on_boarding_state.dart';
import 'package:movies_app/utiles/commen_widgets/blurred_layer_view.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
     final cubit = BlocProvider.of<OnboardingCubit>(context);
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state.isFinished) {
          Navigator.of(context).pushReplacementNamed(RouteNames.login);
        }
      },
      child: BlurredLayerView(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (BuildContext context, state) {
            return PageView.builder(
              itemCount: state.onboardingList.length,
              controller: cubit.pageController,
              onPageChanged: (value) =>
                  cubit.doIntent(ChangePageIntent(pageIndex: value)),
              itemBuilder: (BuildContext context, int index) =>
                  OnboardingItem(
                    entity: state.onboardingList[index],
                    index: index,
                  ),

            );
          },
        ),
      ),
    );
  }
}
