import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/view/screen/onBoarding/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../cubit/onboarding_cubit.dart';
import '../../../state/onboarding_cubit_state.dart';
import '../../widget/onBoarding_widget/onBoarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // one time OnBoarding screen
    return Scaffold(
      body: BlocListener<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          // if (state is OnboardingCompleted) {
          //   // Navigator.pushReplacement(
          //   //   context,
          //   //   MaterialPageRoute(builder: (context) => HomePage()),
          //   // );
          // }
        },
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            int currentPage = 0;
            bool isLastPage = false;

            if (state is OnboardingPageChanged) {
              currentPage = state.currentPage;
              isLastPage = state.isLastPage;
            }

            return PageView(
              controller: pageController,
              onPageChanged: (index) {
                context.read<OnboardingCubit>().updatePage(index);
              },
              children: [
                OnboardingWidget(
                  title: "test",
                  description: "test test.",
                  image: "assets/picture.jpg",
                  firstButton: 'Continue',
                  onPressedOne:
                      () => pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                  secondButton: '',
                  onPressedTwo: () {},
                  isVisible: isLastPage,
                ),
                OnboardingWidget(
                  title: "test",
                  description: "test test testtesttest.",
                  image: "assets/picture.jpg",
                  firstButton: 'Continue',
                  onPressedOne:
                      () => pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                  secondButton: '',
                  onPressedTwo: () {},
                  isVisible: isLastPage,
                ),
                OnboardingWidget(
                  title: "testtesttest",
                  description: "testtesttesttesttest.",
                  image: "assets/picture.jpg",
                  firstButton: 'Continue',
                  onPressedOne:
                      () => pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                  secondButton: '',
                  onPressedTwo: () {},
                  isVisible: isLastPage,
                ),
                OnboardingWidget(
                  title: "testtesttesttesttest",
                  description: "testtesttesttesttesttest",
                  image: "assets/picture.jpg",
                  firstButton: 'DO IT ',
                  onPressedOne:
                      () {
                        context.read<OnboardingCubit>().completeOnboarding();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                  // saves the state
                  secondButton: 'Cancel',
                  onPressedTwo:
                      () {
                        context.read<OnboardingCubit>().completeOnboarding();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                  isVisible: isLastPage,
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          bool isLastPage =
              (state is OnboardingPageChanged) ? state.isLastPage : false;
          return isLastPage // if its the last page remove the bottom sheet
              ? SizedBox()
              : SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.read<OnboardingCubit>().completeOnboarding();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Center(
                      // the three dots in the middle
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black12,
                          activeDotColor: Color(0xFF25AE4B),
                        ),
                        onDotClicked: (index) {
                          pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ),
                    IconButton(
                      // to move on page at a time
                      onPressed: () {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Color(0xFF25AE4B), Color(0xFF0F481F)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
              );
        },
      ),
    );
  }
}
