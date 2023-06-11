import 'package:flutter/material.dart';

import '../widgets/add_demo_cameras_button.dart';
import '../widgets/add_recent_camera_card.dart';

class ManualCameraPairingPage extends StatelessWidget {
  const ManualCameraPairingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Column(
          children: [
            AddRecentCameraCard(),
            Spacer(),
            AddDemoCamerasButton(),
          ],
        ),
      ),
    );
  }
}
