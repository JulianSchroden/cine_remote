import 'package:flutter/material.dart';

import '../widgets/add_recent_camera_card.dart';

class ManualCameraPairingPage extends StatelessWidget {
  const ManualCameraPairingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          AddRecentCameraCard(),
        ],
      ),
    );
  }
}
