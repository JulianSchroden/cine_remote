import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/eos_cine_http/eos_cine_http_camera_handle.dart';
import '../../../../camera_control/eos_ptp_ip/eos_ptp_ip_camera_handle.dart';
import '../../../../camera_control/interface/models/camera_handle.dart';
import '../../../core/extensions/camera_model_display_extension.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

class RecentCameraItem extends StatelessWidget {
  final CameraHandle cameraHandle;

  const RecentCameraItem({
    required this.cameraHandle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final previewImagePath = cameraHandle.model.productImagePath();

    return InkWell(
      onTap: () => context.read<CameraConnectionCubit>().connect(cameraHandle),
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
                  cameraHandle.model.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 4),
                Text(
                  cameraHandle.connectionInfo,
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

extension CameraHandleConnectionInfoExtension on CameraHandle {
  String get connectionInfo {
    switch (runtimeType) {
      case EosCineHttpCameraHandle:
        return (this as EosCineHttpCameraHandle).address;
      case EosPtpIpCameraHandle:
        return (this as EosPtpIpCameraHandle).address;
    }

    return '';
  }
}


// DiscoveredCamera
// RecentCamera