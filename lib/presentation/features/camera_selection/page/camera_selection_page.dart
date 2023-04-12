import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../../../cine_remote_colors.dart';
import '../../../core/widgets/laoding_overlay_layout.dart';
import '../../../routes.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../bloc/camera_discovery_cubit.dart';
import '../widgets/camera_discovery_card.dart';
import '../widgets/recent_cameras_list.dart';

class CameraSelectionPage extends StatelessWidget {
  const CameraSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CineRemoteColors.background,
      body: BlocProvider(
        create: (context) => CameraDiscoveryCubit(NetworkInfo())..init(),
        child: BlocConsumer<CameraConnectionCubit, CameraConnectionState>(
          listener: (context, state) {
            state.maybeWhen(
                connected: (_) =>
                    Navigator.of(context).pushNamed(Routes.cameraControl),
                connectingFailed: () =>
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: const [
                            Icon(
                              Icons.error,
                              color: CineRemoteColors.warning,
                            ),
                            SizedBox(width: 8),
                            Text('Failed to connect to camera')
                          ],
                        ),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                orElse: () {});
          },
          builder: (context, state) => LoadingOverlayLayout(
            backgroundColor: const Color.fromARGB(200, 0, 0, 0),
            showOverlay: state.isLoading,
            overlayMessage: 'Connecting',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                CameraDisoveryCard(),
                Expanded(child: RecentCamerasList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
