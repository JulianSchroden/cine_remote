import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cine_remote_colors.dart';
import '../../recent_cameras/bloc/recent_cameras_cubit.dart';

class AddRecentCameraCard extends StatefulWidget {
  const AddRecentCameraCard({super.key});

  @override
  State<AddRecentCameraCard> createState() => _AddRecentCameraCardState();
}

class _AddRecentCameraCardState extends State<AddRecentCameraCard> {
  late final TextEditingController encodedContentController;

  @override
  void initState() {
    encodedContentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    encodedContentController.dispose();
    super.dispose();
  }

  void addRecentCamera(BuildContext context) {
    final encodedCamera = encodedContentController.text;
    encodedContentController.clear();
    context.read<RecentCamerasCubit>().addEncodedCamera(encodedCamera);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CineRemoteColors.background,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transfer Pairing Data',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 8),
          TextField(
            minLines: 5,
            maxLines: 5,
            controller: encodedContentController,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                addRecentCamera(context);
              },
              child: const Text('Add to recent cameras'),
            ),
          )
        ],
      ),
    );
  }
}
