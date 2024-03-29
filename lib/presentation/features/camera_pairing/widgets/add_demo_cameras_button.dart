import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter/material.dart';

import '../../../../dependencies.dart';
import '../../recent_cameras/repository/recent_cameras_repository.dart';

class AddDemoCamerasButton extends StatelessWidget {
  const AddDemoCamerasButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Add demo cameras'),
      onPressed: () => seedRecentCameras(),
    );
  }

  Future<void> seedRecentCameras() async {
    final recentCameraRepository = get<RecentCamerasRepostitory>();
    await recentCameraRepository.addCamera(
      const CameraConnectionHandle(
        id: 'demo-1',
        model: CameraModels.demoCamera,
        pairingData: DemoCameraPairingData(),
      ),
    );

    await recentCameraRepository.addCamera(
      const CameraConnectionHandle(
        id: 'eos-cine-http-1',
        model: CameraModels.canonC100II,
        pairingData: EosCineHttpCameraPairingData(),
      ),
    );
  }
}
