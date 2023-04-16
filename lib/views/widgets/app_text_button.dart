import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.text,
    this.padding,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.grayColor,
        foregroundColor: foregroundColor ?? AppColors.blackColor,
        textStyle: AppFonts.bodyStyle,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.whiteColor,
          ),
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
      ),
      onPressed: onPressed,
      child: Text(
        "$text",
      ),
    );
  }
}
