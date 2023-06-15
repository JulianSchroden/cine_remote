import 'package:flutter/material.dart';

import '../widgets/add_demo_cameras_button.dart';
import '../widgets/add_recent_camera_card.dart';

class ManualCameraPairingPage extends StatelessWidget {
  const ManualCameraPairingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const AddRecentCameraCard(),
            const SizedBox(height: 32),
            TextButton(
              child: const Text('Throw test exception'),
              onPressed: () => throw Exception(
                  "Test Exception to verify Firebase connection"),
            ),
            const Spacer(),
            const AddDemoCamerasButton(),
          ],
        ),
      ),
    );
  }
}
