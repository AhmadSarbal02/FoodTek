abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {
  final int currentPage;
  final bool isLastPage;

  OnboardingPageChanged(this.currentPage, this.isLastPage);
}

class OnboardingCompleted extends OnboardingState {}
