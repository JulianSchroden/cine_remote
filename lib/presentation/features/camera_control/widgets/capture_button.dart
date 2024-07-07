import 'package:flutter/material.dart';

import '../../../cine_remote_colors.dart';

class CaptureButton extends StatelessWidget {
  final ShapeBorder shape;
  final void Function() onPressed;
  final Color color;

  const CaptureButton({
    required this.shape,
    required this.onPressed,
    this.color = CineRemoteColors.primary,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Material(
        shape: shape,
        color: color,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onPressed,
          child: const SizedBox(
            width: 72,
            height: 72,
          ),
        ),
      );
}
