import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../state/onboarding_cubit_state.dart';


class OnboardingCubit extends Cubit<OnboardingState> {//from chatGPT
  OnboardingCubit() : super(OnboardingInitial());

  final int totalPages = 4;

  void updatePage(int index) {
    bool isLast = index == totalPages - 1; // Last page check
    emit(OnboardingPageChanged(index, isLast));
  }

  /// Saves onboarding completion state when the user presses a button
  Future<void> completeOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showHome', true);
    emit(OnboardingCompleted());
  }
}
