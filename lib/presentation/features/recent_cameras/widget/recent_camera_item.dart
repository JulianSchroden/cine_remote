import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/demo/demo_camera_pairing_data.dart';
import '../../../../camera_control/eos_cine_http/eos_cine_http_camera_pairing_data.dart';
import '../../../../camera_control/eos_ptp_ip/eos_ptp_ip_camera_pairing_data.dart';
import '../../../core/extensions/camera_model_display_extension.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../repository/recent_camera.dart';

class RecentCameraItem extends StatelessWidget {
  final RecentCamera recentCamera;

  const RecentCameraItem({
    required this.recentCamera,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final previewImagePath = recentCamera.model.productImagePath();

    return InkWell(
      onTap: () => context
          .read<CameraConnectionCubit>()
          .connect(recentCamera.toCameraHandle()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
  String get connectionInfo {
    switch (pairingData.runtimeType) {
      case DemoCameraPairingData:
        return 'XXX.XXX.XXX.XXX';
      case EosCineHttpCameraPairingData:
        return (pairingData as EosCineHttpCameraPairingData).address;
      case EosPtpIpCameraPairingData:
        return (pairingData as EosPtpIpCameraPairingData).address;
    }

    return '';
  }
}
