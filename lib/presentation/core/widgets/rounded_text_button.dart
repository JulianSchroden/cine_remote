import 'package:flutter/material.dart';

import '../../cine_remote_colors.dart';

class RoundedTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double minWidth;
  final bool showLoadingIndicator;

  static const double height = 44;
  static const double loadingIndicatorSize = 16;

  const RoundedTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.minWidth = 280,
    this.showLoadingIndicator = false,
  });

  @override
  Widget build(BuildContext context) => Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          TextButton(
            style: ButtonStyle(
              minimumSize:
                  WidgetStateProperty.all<Size>(Size(minWidth, height)),
              fixedSize:
                  WidgetStateProperty.all<Size>(const Size.fromHeight(height)),
              shape: WidgetStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(height / 2),
                  ),
                ),
              ),
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: height / 2),
              ),
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return CineRemoteColors.primary.withOpacity(0.75);
                }

                return CineRemoteColors.primary;
              }),
              foregroundColor: WidgetStateProperty.all<Color>(
                CineRemoteColors.primaryForeground,
              ),
            ),
            onPressed: onPressed,
            child: Padding(
              padding:
                  EdgeInsets.only(right: showLoadingIndicator ? height / 2 : 0),
              child: Text(text),
            ),
          ),
          if (showLoadingIndicator)
            const Padding(
              padding:
                  EdgeInsets.only(right: (height - loadingIndicatorSize) / 2),
              child: SizedBox(
                width: loadingIndicatorSize,
                height: loadingIndicatorSize,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: Colors.white,
                ),
              ),
            )
        ],
      );
}
