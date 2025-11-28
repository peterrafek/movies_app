import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/cache/shared_preferences_helper.dart';
import 'package:movies_app/core/constanse/const_keys.dart';
import 'package:movies_app/presentation/on_boarding/views_model/on_boarding_intent.dart';
import 'package:movies_app/presentation/on_boarding/views_model/on_boarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  final SharedPreferencesHelper _sharedPreferencesHelper;

  OnboardingCubit(this._sharedPreferencesHelper) : super(OnboardingState());
  late final PageController pageController;

  void doIntent(OnboardingIntent intent) {
    switch (intent) {
      case OnboardingInitializationIntent():
        _onInit();
        break;
      case ChangePageIntent():
        _updateCurrentPageIndex(index: intent.pageIndex);
        break;

      case MoveToNextPageIntent():
        _moveToNextPage();
        break;

      case MoveToBackPageIntent():
        _moveToBackPage();
        break;
    }
  }

  void _onInit() {
    pageController = PageController();
  }

  void _updateCurrentPageIndex({required int index}) {
    emit(state.copyWith(currentPageIndex: state.currentPageIndex + 1));
  }

  Future<void> _moveToNextPage() async {
    if (pageController.page == state.onboardingList.length - 1) {
      await _finishedOnboarding();
    } else {
      await pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      _updateCurrentPageIndex(index: pageController.page?.toInt() ?? 0);
    }
  }

  void _moveToBackPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  Future<void> _finishedOnboarding() async {
    await _sharedPreferencesHelper.saveBool(
      key: ConstKeys.isOnboardingFinished,
      value: true,
    );
    emit(state.copyWith(isFinished: true));
  }
}
