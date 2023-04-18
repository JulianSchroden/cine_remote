import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/demo/demo_camera_pairing_data.dart';
import '../../../../camera_control/eos_cine_http/eos_cine_http_camera_pairing_data.dart';
import '../../../../camera_control/eos_ptp_ip/eos_ptp_ip_camera_pairing_data.dart';
import '../../../core/extensions/camera_model_display_extension.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../bloc/recent_cameras_cubit.dart';
import '../repository/recent_camera.dart';

class RecentCameraItem extends StatefulWidget {
  final RecentCamera recentCamera;

  const RecentCameraItem({
    required this.recentCamera,
    super.key,
  });

  @override
  State<RecentCameraItem> createState() => _RecentCameraItemState();
}

class _RecentCameraItemState extends State<RecentCameraItem> {
  bool hasPendingDeleteAction = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu.builder(
      actions: [
        CupertinoContextMenuAction(
          trailingIcon: Icons.close,
          isDestructiveAction: true,
          onPressed: () {
            hasPendingDeleteAction = true;
            Navigator.of(context).pop();
          },
          child: const Text('Forget'),
        ),
      ],
      builder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, Animation<double> animation) {
    final previewImagePath = widget.recentCamera.model.productImagePath();
    final isTappable = animation.status != AnimationStatus.forward &&
        animation.status != AnimationStatus.reverse &&
        animation.value == 0.0;
    final backgroundColorAnimation =
        ColorTween(begin: Colors.grey[900]!, end: Colors.grey[850])
            .animate(animation);
    final heightAnimation =
        Tween<double>(begin: 72, end: 120).animate(animation);

    handleDeleteIfPending(context, animation);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12 * animation.value),
      child: Material(
        color: backgroundColorAnimation.value,
        child: InkWell(
          onTap: isTappable
              ? () => context
                  .read<CameraConnectionCubit>()
                  .connect(widget.recentCamera.toCameraHandle())
              : null,
          child: SizedBox(
            height: heightAnimation.value,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16 + 16 * animation.value,
              ),
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
                        widget.recentCamera.model.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.recentCamera.connectionInfo,
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
          ),
        ),
      ),
    );
  }

  void handleDeleteIfPending(
      BuildContext context, Animation<double> animation) {
    if (animation.status != AnimationStatus.dismissed) {
      return;
    }

    if (hasPendingDeleteAction) {
      hasPendingDeleteAction = false;

      context.read<RecentCamerasCubit>().forgetCamera(widget.recentCamera);
    }
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
