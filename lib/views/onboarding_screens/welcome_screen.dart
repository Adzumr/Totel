import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:totel/utils/route_config/route_names.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/helper.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final aspectRatio = MediaQuery.of(context).size.flipped.aspectRatio;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                CarouselWidget(
                  pageController: pageController,
                  aspectRatio: aspectRatio,
                ),
                Positioned(
                  bottom: 10 * aspectRatio,
                  right: 0,
                  left: 0,
                  child: AccessButtons(aspectRatio: aspectRatio),
                ),
                Positioned(
                  top: 20 * aspectRatio,
                  right: 10 * aspectRatio,
                  child: const SkipButton(),
                ),
                // PageIndicator(
                //   pageController: pageController,
                //   aspectRatio: aspectRatio,
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.pageController,
    required this.aspectRatio,
  });

  final PageController pageController;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: const Alignment(0, 0.2),
      child: SmoothPageIndicator(
        controller: pageController,
        effect: WormEffect(
          activeDotColor: AppColors.whiteColor,
          dotColor: AppColors.whiteColor.withOpacity(.5),
          dotHeight: 3.5 * aspectRatio,
          dotWidth: 3.5 * aspectRatio,
          type: WormType.thin,
        ),
        count: 4,
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.blackColor,
        textStyle: AppFonts.smallBodyStyle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: AppColors.whiteColor,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      onPressed: () {
        Get.toNamed(AppRouteNames.login);
      },
      child: Text(
        "Skip",
        style: AppFonts.smallBodyStyle.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.pageController,
    required this.aspectRatio,
  });

  final PageController pageController;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: PageView.builder(
        controller: pageController,
        itemCount: HelperClass.welcomeMessges.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(HelperClass.welcomeMessges[index].image!),
              ),
              SizedBox(height: 10 * aspectRatio),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      HelperClass.welcomeMessges[index].title!,
                      textAlign: TextAlign.center,
                      style: AppFonts.headingStyle,
                    ),
                    SizedBox(height: 5 * aspectRatio),
                    Text(
                      HelperClass.welcomeMessges[index].message!,
                      textAlign: TextAlign.center,
                      style: AppFonts.bodyStyle.copyWith(
                        color: AppColors.blackColor.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AccessButtons extends StatelessWidget {
  const AccessButtons({
    super.key,
    required this.aspectRatio,
  });

  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15 * aspectRatio),
          AppTextButton(
            text: "Create an account",
            onPressed: () {
              Get.toNamed(AppRouteNames.signUp);
            },
          ),
          SizedBox(height: 5 * aspectRatio),
          AppElevatedButton(
            text: "Sign In",
            onPressed: () {
              Get.toNamed(AppRouteNames.login);
            },
          ),
        ],
      ),
    );
  }
}
