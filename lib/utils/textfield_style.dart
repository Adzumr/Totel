import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

final InputDecoration appTextFieldStyle = InputDecoration(
    fillColor: AppColors.grayColor,
    filled: true,
    contentPadding: const EdgeInsets.all(20),
    labelStyle: AppFonts.smallBodyStyle,
    focusedBorder: enableInputBorder,
    enabledBorder: enableInputBorder,
    border: enableInputBorder,
    disabledBorder: enableInputBorder);
final enableInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide.none,
);
