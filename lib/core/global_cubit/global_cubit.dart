
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/cache/shared_preferences_helper.dart';
import 'package:movies_app/core/constanse/const_keys.dart';
import 'package:movies_app/core/global_cubit/global_state.dart';
import 'package:movies_app/core/router/route_names.dart';
import 'package:movies_app/core/secure_storage/secure_storage.dart';

import 'global_intent.dart';

@injectable
class GlobalCubit extends Cubit<GlobalState> {
  final SecureStorage _secureStorage;
  final SharedPreferencesHelper _sharedPreferencesHelper;

  GlobalCubit(this._secureStorage, this._sharedPreferencesHelper)
      : super(const GlobalState());

  Future<void> doIntent({required GlobalIntent intent}) async {
    switch (intent) {
      case GlobalInitializationIntent():
        await _onInit();
        break;
      case ChangeLanguageIntent():
        await _changedLanguageIndex(
          newSelectedLanguage: intent.newSelectedLanguage,
        );
        break;
    }
  }

  Future<void> _onInit() async {
    _getSelectedLanguage();
    await _setRedirectedScreen();
  }

  void _getSelectedLanguage() {
    final isArLanguage = _sharedPreferencesHelper.getBool(
      key: ConstKeys.isArLanguage,
    );
    if (isArLanguage) {
      emit(state.copyWith(selectedLanguage: Language.arabic));
    } else {
      emit(state.copyWith(selectedLanguage: Language.english));
    }
  }

  Future<void> _setRedirectedScreen() async {
    final userToken = await _secureStorage.getData(key: ConstKeys.tokenKey);
    final isLoginScreen = _sharedPreferencesHelper.getBool(
      key: ConstKeys.isOnboardingFinished,
    );
    if (userToken != null) {
      // emit(state.copyWith(redirectedScreen: RouteNames.splash));
    } else if (isLoginScreen) {
      // emit(state.copyWith(redirectedScreen: RouteNames.login));
    } else {
      emit(state.copyWith(redirectedScreen: RouteNames.onboarding));
    }
    // FlutterNativeSplash.remove(); uncomment this line to remove splash screen after setting redirected screen
  }

  Future<void> _changedLanguageIndex({
    required Language newSelectedLanguage,
  }) async {
    if (newSelectedLanguage == Language.english) {
      await _sharedPreferencesHelper.saveBool(
        key: ConstKeys.isArLanguage,
        value: false,
      );
      emit(state.copyWith(selectedLanguage: Language.english));
    } else {
      await _sharedPreferencesHelper.saveBool(
        key: ConstKeys.isArLanguage,
        value: true,
      );
      emit(state.copyWith(selectedLanguage: Language.arabic));
    }
  }
}