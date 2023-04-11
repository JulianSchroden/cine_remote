import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../camera_control/demo/demo_camera_handle.dart';
import '../../../../camera_control/eos_cine_http/eos_cine_http_camera_handle.dart';
import '../../../../camera_control/eos_ptp_ip/eos_ptp_ip_camera_handle.dart';
import '../../../../camera_control/interface/camera_factory.dart';
import 'recent_camera_item.dart';

class RecentCamerasList extends StatelessWidget {
  const RecentCamerasList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recents',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Pair Manually'),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                RecentCameraItem(
                  cameraHandle: EosPtpIpCameraHandle(
                    model: CameraModels.canon70D,
                    guid:
                        Uint8List.fromList(List.generate(16, (index) => 0x00)),
                    address: '192.168.178.43',
                    clientName: 'Cine Remote',
                  ),
                ),
                const RecentCameraItem(
                  cameraHandle: EosCineHttpCameraHandle(
                    model: CameraModels.canonC100II,
                  ),
                ),
                const RecentCameraItem(
                  cameraHandle: DemoCameraHandle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
