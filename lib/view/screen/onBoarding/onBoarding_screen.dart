import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/view/screen/onBoarding/home_page.dart';
import 'package:foodtek/view/widgets/onboarding/onBoarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../cubit/onboarding_cubit.dart';
import '../../../state/onboarding_cubit_state.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // one time OnBoarding screen
    return Scaffold(
      backgroundColor: Colors.white,
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
                  title: "Welcome To Foodtek",
                  description:
                      "Enjoy A Fast And Smooth Food Delivery\n At Your Doorstep",
                  stackImage: "assets/images/pattern.png",
                  onBoardingImg: "assets/images/order-food-pana.png",

                  top: 100,
                  imageWiddth: 328,
                  imageheight: 328,
                  firstButtonText: 'Continue',
                  onPressedOne:
                      () => pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                  secondButtonText: '',
                  onPressedTwo: () {},
                  isVisible: isLastPage,
                ),
                OnboardingWidget(
                  title: "Get Delivery On Time",
                  description:
                      "Order Your Favorite Food Within The \n Plam Of Your Hand And The Zone \n Of Your Comfort",
                  stackImage: "assets/images/pattern.png",
                  onBoardingImg: "assets/images/take-away-cuate.png",
                  top: 150,
                  imageWiddth: 328.5,
                  imageheight: 319,
                  firstButtonText: 'Continue',
                  onPressedOne:
                      () => pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                  secondButtonText: '',
                  onPressedTwo: () {},
                  isVisible: isLastPage,
                ),
                OnboardingWidget(
                  title: "Choose Your Food",
                  description:
                      "Order Your Favorite Food Within The \n Plam Of Your Hand And The Zone \n Of Your Comfort",
                  stackImage: "assets/images/pattern.png",
                  onBoardingImg: "assets/images/take-away-cuate.png",
                  top: 150,
                  imageWiddth: 328.5,
                  imageheight: 319,
                  firstButtonText: 'Continue',
                  onPressedOne:
                      () => pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                  secondButtonText: '',
                  onPressedTwo: () {},
                  isVisible: isLastPage,
                ),
                OnboardingWidget(
                  title: "Turn On Your Location",
                  description:
                      "To Continues, Let Your Device Turn \n On Location, Which Uses Google’s\n Location Service",
                  stackImage: "assets/images/maps.png",
                  onBoardingImg: "assets/images/take-away-cuate.png",
                  top: 150,
                  imageWiddth: 328.5,
                  imageheight: 319,
                  firstButtonText: 'Yes, Turn It On',
                  onPressedOne: () {
                    context.read<OnboardingCubit>().completeOnboarding();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  // saves the state
                  secondButtonText: 'Cancel',
                  onPressedTwo: () {
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
              : Container(
                height: 60,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          dotWidth: 10,
                          dotHeight: 10,
                          spacing: 16,
                          dotColor: Colors.black12,
                          activeDotColor: Color.fromARGB(255, 37, 174, 76),
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
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color.fromARGB(255, 29, 255, 93),
                        ),
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
