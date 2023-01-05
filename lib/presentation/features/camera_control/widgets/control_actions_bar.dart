import 'package:flutter/material.dart';

import '../../../cine_remote_colors.dart';

class ControlActionsBar extends StatelessWidget {
  const ControlActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const CircleBorder(),
      color: CineRemoteColors.primary,
      onPressed: () {},
      child: const SizedBox(
        width: 72,
        height: 72,
      ),
    );
  }
}
