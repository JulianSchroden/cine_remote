import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/demo/demo_camera_pairing_data.dart';
import '../../../../camera_control/eos_cine_http/eos_cine_http_camera_pairing_data.dart';
import '../../../../camera_control/interface/camera_factory.dart';
import '../../../../camera_control/interface/models/camera_handle.dart';
import '../../../../dependencies.dart';
import '../../camera_selection/widgets/card_header.dart';
import '../bloc/recent_cameras_cubit.dart';
import '../repository/recent_camera.dart';
import '../repository/recent_cameras_repository.dart';
import 'recent_camera_item.dart';

class RecentCamerasList extends StatelessWidget {
  final EdgeInsets padding;
  final bool respectsLeftSafeArea;
  final bool respectsTopSafeArea;

  const RecentCamerasList({
    required this.padding,
    required this.respectsLeftSafeArea,
    required this.respectsTopSafeArea,
    super.key,
  });

  const RecentCamerasList.portrait({super.key})
      : padding = const EdgeInsets.only(top: 16),
        respectsLeftSafeArea = true,
        respectsTopSafeArea = false;

  const RecentCamerasList.landscape({super.key})
      : padding = const EdgeInsets.only(left: 16),
        respectsLeftSafeArea = false,
        respectsTopSafeArea = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentCamerasCubit, RecentCamerasState>(
      builder: (context, state) => SafeArea(
        left: respectsLeftSafeArea,
        top: respectsTopSafeArea,
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardHeader(
                title: 'Recents',
                action: TextButton(
                  onPressed: () => seedRecentCameras(),
                  child: const Text('Pair Manually'),
                ),
              ),
              Expanded(
                child: state.maybeWhen(
                  success: (recentCameras) =>
                      _buildList(context, recentCameras),
                  orElse: () => Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<RecentCamera> recentCameras) =>
      ListView(
        padding: const EdgeInsets.all(0),
        children: recentCameras
            .map((recentCamera) => RecentCameraItem(recentCamera: recentCamera))
            .toList(),
      );

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
