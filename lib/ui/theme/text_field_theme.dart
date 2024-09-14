import 'package:flutter/material.dart';
import 'package:install_apk/ui/theme/app_colors.dart';
import 'package:install_apk/ui/theme/app_text_theme.dart';
import 'package:install_apk/utilities/sizes.dart';

class TpsTextFormFieldTheme {
  TpsTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TpsColors.darkGrey,
    suffixIconColor: TpsColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TpsSizes.inputFieldHeight),
    labelStyle: TpsTextTheme.lightTextTheme.titleSmall!
        .copyWith(color: TpsColors.darkGrey),
    hintStyle: TpsTextTheme.lightTextTheme.bodyLarge!
        .copyWith(color: TpsColors.darkGrey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: TpsColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 1, color: TpsColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 1, color: TpsColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 1, color: TpsColors.darkGrey),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 1, color: TpsColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 2, color: TpsColors.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TpsColors.darkGrey,
    suffixIconColor: TpsColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TpsSizes.inputFieldHeight),
    labelStyle: TpsTextTheme.darkTextTheme.titleSmall!
        .copyWith(color: TpsColors.darkGrey),
    hintStyle: TpsTextTheme.darkTextTheme.bodyMedium!
        .copyWith(color: TpsColors.darkGrey),
    floatingLabelStyle:
        const TextStyle().copyWith(color: TpsColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 1, color: TpsColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 1, color: TpsColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 1, color: TpsColors.grey),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 1, color: TpsColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TpsSizes.borderRadiusLg),
      borderSide: const BorderSide(width: 2, color: TpsColors.error),
    ),
  );
}
