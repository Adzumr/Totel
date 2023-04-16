import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppFonts {
  static TextStyle smallBodyStyle = GoogleFonts.roboto(
    fontSize: 12,
    // fontSize: 9.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyStyle = GoogleFonts.roboto(
    fontSize: 14,
    // fontSize: 12.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle titleStyle = GoogleFonts.roboto(
    fontSize: 18,
    // fontSize: 14.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headingStyle = GoogleFonts.roboto(
    fontSize: 22,
    // fontSize: 20.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );
}
