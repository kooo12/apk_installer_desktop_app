import 'package:flutter/material.dart';
import 'package:install_apk/ui/theme/app_colors.dart';
import 'package:install_apk/utilities/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TpsElevatedButtonTheme {
  TpsElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TpsColors.light,
      backgroundColor: TpsColors.primary,
      disabledForegroundColor: TpsColors.darkGrey,
      disabledBackgroundColor: TpsColors.buttonDisabled,
      // side: const BorderSide(color: TpsColors.primary),
      padding: const EdgeInsets.symmetric(vertical: TpsSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16,
          color: TpsColors.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TpsSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TpsColors.light,
      backgroundColor: TpsColors.primary,
      disabledForegroundColor: TpsColors.darkGrey,
      disabledBackgroundColor: TpsColors.darkerGrey,
      // side: const BorderSide(color: TpsColors.primary),
      padding: const EdgeInsets.symmetric(vertical: TpsSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16,
          color: TpsColors.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TpsSizes.buttonRadius)),
    ),
  );
}
