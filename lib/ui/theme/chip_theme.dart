import 'package:flutter/material.dart';
import 'package:install_apk/ui/theme/app_colors.dart';
import 'package:install_apk/utilities/sizes.dart';

class TpsChipTheme {
  TpsChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: TpsColors.grey.withOpacity(0.4),
    // labelStyle: const TextStyle(color: TpsColors.black),
    selectedColor: TpsColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    backgroundColor: TpsColors.white,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TpsSizes.borderRadiusMd)),
    side: const BorderSide(color: TpsColors.grey),
    checkmarkColor: TpsColors.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: TpsColors.darkerGrey,
    // labelStyle: TextStyle(color: TpsColors.white),
    selectedColor: TpsColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    backgroundColor: TpsColors.dark,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TpsSizes.borderRadiusMd)),
    side: const BorderSide(color: TpsColors.grey),
    checkmarkColor: TpsColors.white,
  );
}
