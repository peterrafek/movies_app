import 'package:equatable/equatable.dart';
import 'package:movies_app/core/constanse/app_images.dart';
import 'package:movies_app/core/constanse/app_text.dart';
import 'package:movies_app/domain/entities/onboarding/onboarding_entity.dart';

final class OnboardingState extends Equatable {
  final List<OnboardingEntity> onboardingList = const [
    OnboardingEntity(
      title: AppText.onboardingTitle1,
      subTitle: AppText.onboardingSubTitle1,
      onboardingImage: AppImages.onboarding1,
    ),
    OnboardingEntity(
      title: AppText.onboardingTitle2,
      subTitle: AppText.onboardingSubTitle2,
      onboardingImage: AppImages.onboarding2,
    ),
    OnboardingEntity(
      title: AppText.onboardingTitle3,
      subTitle: AppText.onboardingSubTitle3,
      onboardingImage: AppImages.onboarding3,
    ),
    OnboardingEntity(
      title: AppText.onboardingTitle4,
      subTitle: AppText.onboardingSubTitle4,
      onboardingImage: AppImages.onboarding4,
    ),
    OnboardingEntity(
      title: AppText.onboardingTitle5,
      subTitle: AppText.onboardingSubTitle5,
      onboardingImage: AppImages.onboarding5,
    ),
    OnboardingEntity(
      title: AppText.onboardingTitle6,
       onboardingImage: AppImages.onboarding6,
    ),
  ];

  final int currentPageIndex;
  final bool isFinished;

  const OnboardingState({this.currentPageIndex = 0, this.isFinished = false});

  OnboardingState copyWith({int? currentPageIndex, bool? isFinished}) {
    return OnboardingState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  @override
  List<Object?> get props => [currentPageIndex, isFinished];
}
