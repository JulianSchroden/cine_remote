import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/recent_cameras_cubit.dart';
import '../repository/recent_camera.dart';
import 'recent_camera_item.dart';

class RecentCamerasList extends StatelessWidget {
  const RecentCamerasList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentCamerasCubit, RecentCamerasState>(
      builder: (context, state) => SafeArea(
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
              child: state.maybeWhen(
                  success: (recentCameras) =>
                      _buildList(context, recentCameras),
                  orElse: () => Container()),
            ),
          ],
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
}
