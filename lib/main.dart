import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totel/route_config/route_configuration.dart';
import 'package:totel/route_config/route_names.dart';

import 'utils/app_colors.dart';
import 'utils/app_fonts.dart';
import 'views/error_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorScreen(
        error: details,
      );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const TotelApp());
}

SharedPreferences? sharedPreferences;

class TotelApp extends StatelessWidget {
  const TotelApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Totel',
      defaultTransition:
          Transition.circularReveal, // Sets the default transition animation
      defaultGlobalState: true, // Makes state management global by default
      getPages: AppRoutesConfiguration.routes, // Defines the routes for the app

      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: const IconThemeData(
          color: AppColors.indigoColor,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.indigoColor,
        ),
        // TextTheme for the app
        textTheme: TextTheme(
          bodyMedium: AppFonts.bodyStyle,
        ),
        // ColorScheme for the app
        useMaterial3: true,
      ),
      initialRoute: AppRouteNames.welcome,
    );
  }
}
