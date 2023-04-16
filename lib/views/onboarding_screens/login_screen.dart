import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:totel/widgets/app_text_button.dart';

import '../../route_config/route_names.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/textfield_style.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/back_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final countryCode = ValueNotifier("+1");
  final formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: screenSize.height,
          width: screenSize.width,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const AppBackButton(),
                    SizedBox(height: 10 * screenSize.flipped.aspectRatio),
                    Text(
                      "Let’s start with phone",
                      style: AppFonts.headingStyle,
                    ),
                    SizedBox(height: 5 * screenSize.flipped.aspectRatio),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "Don’t have an account?",
                        style: AppFonts.bodyStyle.copyWith(
                            color: AppColors.blackColor.withOpacity(.8)),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Create an account',
                            style: AppFonts.bodyStyle.copyWith(
                              color: AppColors.indigoColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(AppRouteNames.signUp);
                              },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15 * screenSize.flipped.aspectRatio),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.grayColor,
                      ),
                      child: StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return CountryCodePicker(
                              onChanged: (value) {
                                countryCode.value = value.dialCode!;
                              },
                              initialSelection: 'US',
                              hideSearch: false,
                              hideMainText: false,
                              textOverflow: TextOverflow.ellipsis,
                              textStyle: AppFonts.smallBodyStyle,
                              closeIcon: const Icon(Icons.phone),
                              showDropDownButton: true,
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: true,
                              favorite: const ['+1'],
                              alignLeft: true,
                            );
                          }),
                    ),
                    SizedBox(height: 5 * screenSize.flipped.aspectRatio),
                    ValueListenableBuilder(
                      valueListenable: countryCode,
                      builder:
                          (BuildContext context, dynamic value, Widget? child) {
                        return TextFormField(
                          controller: phoneNumberController,
                          style: AppFonts.smallBodyStyle,
                          maxLength: 10,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Enter Phone Number";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.length == 10) {
                              FocusScope.of(context).unfocus();
                            }
                            log(countryCode.value);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.phone,
                          decoration: appTextFieldStyle.copyWith(
                            labelText: "Enter your phone number",
                            counterText: "",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                countryCode.value,
                                style: AppFonts.smallBodyStyle,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15 * screenSize.flipped.aspectRatio),
                    AppElevatedButton(
                      text: "Continue",
                      onPressed: () {},
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppElevatedButton(
                      backgroundColor: AppColors.blackColor,
                      foregroundColor: AppColors.whiteColor,
                      text: "Continue with Apple",
                      onPressed: () {},
                    ),
                    SizedBox(height: 5 * screenSize.flipped.aspectRatio),
                    AppTextButton(
                      text: "Continue with Google",
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
