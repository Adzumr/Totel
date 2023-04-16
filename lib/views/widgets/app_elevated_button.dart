import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    required this.text,
    super.key,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.indigoColor,
        foregroundColor: foregroundColor ?? AppColors.whiteColor,
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
