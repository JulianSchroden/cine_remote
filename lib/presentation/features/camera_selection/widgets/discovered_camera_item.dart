import 'package:flutter/material.dart';

import '../../../../camera_control/interface/models/camera_model.dart';
import '../../../core/extensions/camera_model_display_extension.dart';

class DiscoveredCameraItem extends StatelessWidget {
  final CameraModel cameraModel;
  final bool isLoading;

  const DiscoveredCameraItem({
    required this.cameraModel,
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final previewImagePath = cameraModel.productImagePath();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print('try to connect/ pair to device');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: previewImagePath != null
                  ? Image(
                      image: AssetImage(previewImagePath),
                    )
                  : null,
            ),
            Text(
              cameraModel.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: [
                  Shadow(
                      color: Colors.white,
                      offset: Offset(2, 2),
                      blurRadius: 16.0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
