import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/camera_model_display_extension.dart';

import '../repository/recent_camera.dart';

class RecentCameraItem extends StatelessWidget {
  final RecentCamera recentCamera;
  final void Function()? onTap;
  final void Function()? onLongTap;

  const RecentCameraItem({
    required this.recentCamera,
    this.onTap,
    this.onLongTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final previewImagePath = recentCamera.model.productImagePath();

    return InkWell(
      onTap: onTap,
      onLongPress: onLongTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: previewImagePath != null
                  ? Image(image: AssetImage(previewImagePath))
                  : null,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  recentCamera.model.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 4),
                Text(
                  recentCamera.connectionInfo,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

extension CameraHandleConnectionInfoExtension on RecentCamera {
  String get connectionInfo => switch (pairingData) {
        DemoCameraPairingData() => 'XXX.XXX.XXX.XXX',
        EosCineHttpCameraPairingData(:final address) => address,
        EosPtpIpCameraPairingData(:final address) => address,
        _ => '',
      };
}
