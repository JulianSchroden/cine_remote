import 'package:flutter/material.dart';

import '../widgets/add_recent_camera_card.dart';

class ManualCameraPairingPage extends StatelessWidget {
  const ManualCameraPairingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView(
              children: [
                const SizedBox(height: 24),
                const AddRecentCameraCard(),
                const SizedBox(height: 32),
                TextButton(
                  child: const Text('Throw test exception'),
                  onPressed: () => throw Exception(
                      "Test Exception to verify Firebase connection"),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
