import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: CircleAvatar(
          backgroundColor: AppColors.grayColor,
          radius: 20,
          child: Icon(
            Icons.adaptive.arrow_back,
          ),
        ),
      ),
    );
  }
}
