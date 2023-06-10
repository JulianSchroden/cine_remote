import 'package:flutter/material.dart';

import 'camera_discovery_indicator.dart';

class CameraDiscoveryCardHeader extends StatelessWidget {
  final String title;
  final bool isDiscovering;
  final String? subTitle;

  const CameraDiscoveryCardHeader({
    required this.title,
    required this.isDiscovering,
    this.subTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  CameraDiscoveryIndicator(
                    diameter: 6,
                    padding: const EdgeInsets.only(bottom: 2),
                    isDiscovering: isDiscovering,
                  ),
                ],
              ),
              if (subTitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subTitle!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 243, 243, 243),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
