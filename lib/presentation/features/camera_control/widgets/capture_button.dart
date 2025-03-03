import 'package:flutter/material.dart';

import '../../../cine_remote_colors.dart';

class CaptureButton extends StatelessWidget {
  final ShapeBorder shape;
  final void Function() onPressed;
  final void Function()? onReleased;
  final Color color;

  const CaptureButton({
    required this.shape,
    required this.onPressed,
    this.onReleased,
    this.color = CineRemoteColors.primary,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Material(
        shape: shape,
        color: color,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTapDown: (details) => onPressed(),
          onTapUp: (details) => onReleased?.call(),
          child: const SizedBox(
            width: 72,
            height: 72,
          ),
        ),
      );
}
