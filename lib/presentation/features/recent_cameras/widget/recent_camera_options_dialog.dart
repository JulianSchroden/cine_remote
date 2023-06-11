import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cine_remote_colors.dart';
import '../bloc/recent_cameras_cubit.dart';
import '../repository/recent_camera.dart';
import 'recent_camera_item.dart';
import 'recent_camera_option.dart';

class RecentCameraOptionsDialog extends StatelessWidget {
  final RecentCamera recentCamera;

  const RecentCameraOptionsDialog({
    required this.recentCamera,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              color: CineRemoteColors.background,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(16),
                child: RecentCameraItem(
                  recentCamera: recentCamera,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  RecentCameraOption(
                    title: 'Copy pairing data',
                    icon: Icons.copy,
                    onTap: () {
                      print('copy pairing data');
                      Navigator.of(context).pop();
                    },
                  ),
                  RecentCameraOption(
                    title: 'Forget',
                    icon: Icons.close,
                    isDistructive: true,
                    onTap: () {
                      context
                          .read<RecentCamerasCubit>()
                          .forgetCamera(recentCamera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
