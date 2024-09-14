import 'package:flutter/material.dart';
import 'package:install_apk/ui/theme/app_colors.dart';
import 'package:install_apk/utilities/sizes.dart';

/// Custom Class for Light & Dark Text Themes
class TpsCheckboxTheme {
  TpsCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TpsSizes.xs),
    ),
    side: BorderSide.none,
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TpsColors.white;
      } else {
        return TpsColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TpsColors.primary;
      } else {
        return TpsColors.grey;
      }
    }),
  );

  /// Customizable Dark Text Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TpsSizes.xs),
    ),
    side: BorderSide.none,
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TpsColors.white;
      } else {
        return TpsColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TpsColors.primary;
      } else {
        return TpsColors.darkGrey;
      }
    }),
  );
}
