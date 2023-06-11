import 'package:flutter/material.dart';

import '../../../../camera_control/demo/demo_camera_pairing_data.dart';
import '../../../../camera_control/eos_cine_http/eos_cine_http_camera_pairing_data.dart';
import '../../../../camera_control/interface/camera_factory.dart';
import '../../../../camera_control/interface/models/camera_handle.dart';
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
      const CameraHandle(
        id: 'demo-1',
        model: CameraModels.demoCamera,
        pairingData: DemoCameraPairingData(),
      ),
    );

    await recentCameraRepository.addCamera(
      const CameraHandle(
        id: 'eos-cine-http-1',
        model: CameraModels.canonC100II,
        pairingData: EosCineHttpCameraPairingData(),
      ),
    );
  }
}
