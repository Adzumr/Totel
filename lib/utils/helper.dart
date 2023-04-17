import '../models/welcome_message_model.dart';
import 'app_images.dart';

class HelperClass {
  static List<String> userImages = [
    AppImages.userOne,
    AppImages.userTwo,
    AppImages.userThree,
  ];
  static List<WelcomeMessage> welcomeMessges = [
    WelcomeMessage(
      image: AppImages.onboardingOne,
      title: "Shared living space",
      message:
          "What fun could we have more than having roommate with similar interest.",
    ),
    WelcomeMessage(
      image: AppImages.onboardingTwo,
      title: "Find places around you",
      message:
          "You can find places and stay with hotels and home-stays ranked by travellers.",
    ),
    WelcomeMessage(
      image: AppImages.onboardingThree,
      title: "Find places around you",
      message:
          "You can find places and stay with hotels and home-stays ranked by travellers.",
    ),
    WelcomeMessage(
      image: AppImages.onboardingFour,
      title: "Find places around you",
      message:
          "You can find places and stay with hotels and home-stays ranked by travellers.",
    ),
  ];
}
