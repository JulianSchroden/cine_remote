import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/camera_model_display_extension.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

class CameraDiscoveryItem extends StatelessWidget {
  final DiscoveryHandle discoveryHandle;

  const CameraDiscoveryItem({
    required this.discoveryHandle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cameraModel = discoveryHandle.model;
    final previewImagePath = cameraModel.productImagePath();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context
              .read<CameraConnectionCubit>()
              .connectToDiscoveredCamera(discoveryHandle);
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
