import 'package:flutter/material.dart';

import '../../../cine_remote_colors.dart';

class RecentCameraOption extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function() onTap;
  final bool isDistructive;
  final BorderRadius borderRadius;

  const RecentCameraOption({
    required this.title,
    this.icon,
    required this.onTap,
    this.isDistructive = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Material(
        color: const Color.fromARGB(255, 39, 39, 39),
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Container(
            constraints: const BoxConstraints(minWidth: 200),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color:
                        isDistructive ? CineRemoteColors.warning : Colors.white,
                  ),
                ),
                if (icon != null)
                  Icon(
                    icon,
                    size: 20,
                    color:
                        isDistructive ? CineRemoteColors.warning : Colors.white,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
