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
    Key? key,
    required this.text,
    this.onPressed,
    this.minWidth = 280,
    this.showLoadingIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          TextButton(
            style: ButtonStyle(
              minimumSize:
                  MaterialStateProperty.all<Size>(Size(minWidth, height)),
              fixedSize: MaterialStateProperty.all<Size>(
                  const Size.fromHeight(height)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(height / 2),
                  ),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: height / 2),
              ),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return CineRemoteColors.accent.withOpacity(0.75);
                }

                return CineRemoteColors.accent;
              }),
              foregroundColor: MaterialStateProperty.all<Color>(
                  CineRemoteColors.accentForeground),
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
