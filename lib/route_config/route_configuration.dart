import 'package:get/get.dart';
import 'package:totel/views/onboarding_screens/login_screen.dart';

import '../views/onboarding_screens/signup_screen.dart';
import '../views/onboarding_screens/welcome_screen.dart';
import '../views/partner_UIs/partner_home_screen.dart';
import 'route_names.dart';

class AppRoutesConfiguration {
  static List<GetPage> routes = [
    // Admin Screens
    GetPage(
      name: '/${AppRouteNames.login}',
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: '/${AppRouteNames.signUp}',
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: '/${AppRouteNames.welcome}',
      page: () => const WelcomeScreen(),
    ),

    // Partner Screens
    GetPage(
      name: '/${AppRouteNames.partnerHome}',
      page: () => const PartnerHomeScreen(),
    ),
  ];
}
