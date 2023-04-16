import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_config/route_names.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/app_images.dart';
import 'widgets/app_elevated_button.dart';

class ErrorScreen extends StatefulWidget {
  final FlutterErrorDetails? error;
  const ErrorScreen({required this.error, super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Column(
                children: [
                  const Image(
                    image: AssetImage(AppImages.icon404),
                    height: 200,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Something Went Wrong",
                    textAlign: TextAlign.center,
                    style: AppFonts.headingStyle.copyWith(
                      color: AppColors.redColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.error != null
                        ? widget.error!.summary.toString()
                        : "May be bigfoot has broken this page. \n"
                            "Please try again later.",
                    textAlign: TextAlign.center,
                    style: AppFonts.titleStyle.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              AppElevatedButton(
                text: "Home",
                onPressed: () {
                  Get.toNamed(AppRouteNames.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
