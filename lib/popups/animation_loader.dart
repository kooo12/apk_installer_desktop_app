import 'package:flutter/material.dart';
import 'package:install_apk/ui/theme/app_colors.dart';
import 'package:install_apk/utilities/sizes.dart';
import 'package:lottie/lottie.dart';

// Animated loading indicator with optional text and action button
class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text; // To be displayed below the animation
  final String animation; // Lottie animation file
  final bool showAction; // action button below the text
  final String? actionText; // to display on the action button
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.6),
          const SizedBox(
            height: TpsSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TpsSizes.defaultSpace,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: TpsColors.dark),
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TpsColors.light),
                      )),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
