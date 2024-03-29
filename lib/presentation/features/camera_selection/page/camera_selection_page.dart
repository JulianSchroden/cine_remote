import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependencies.dart';
import '../../../cine_remote_colors.dart';
import '../../../core/widgets/laoding_overlay_layout.dart';
import '../../../routes.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../../camera_pairing/bloc/camera_pairing_cubit.dart';
import '../../recent_cameras/widget/recent_cameras_list.dart';
import '../bloc/camera_discovery_cubit.dart';
import '../widgets/camera_discovery_card.dart';

class CameraSelectionPage extends StatelessWidget {
  const CameraSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CineRemoteColors.background,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => get<CameraDiscoveryCubit>()..init(),
          ),
        ],
        child: BlocConsumer<CameraConnectionCubit, CameraConnectionState>(
          listener: (context, state) {
            state.maybeWhen(
                connected: (_) {
                  context.read<CameraDiscoveryCubit>().stopDiscovery();
                  Navigator.of(context).pushNamed(Routes.cameraControl);
                },
                connectingFailed: () =>
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Row(
                          children: [
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
                requiresPairing: (handle) async {
                  final pairingCubit = context.read<CameraPairingCubit>();
                  pairingCubit.init(handle);

                  await Navigator.of(context).pushNamed(Routes.cameraPairing);

                  pairingCubit.reset();
                },
                disconnected: () {
                  context.read<CameraDiscoveryCubit>().startDiscovery();
                },
                orElse: () {});
          },
          builder: (context, state) => LoadingOverlayLayout(
            backgroundColor: const Color.fromARGB(200, 0, 0, 0),
            showOverlay: state.isLoading,
            overlayMessage: 'Connecting',
            child: OrientationBuilder(builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CameraDisoveryCard.portrait(),
                    Expanded(child: RecentCamerasList.portrait()),
                  ],
                );
              }

              return const Row(
                children: [
                  CameraDisoveryCard.landscape(),
                  Expanded(child: RecentCamerasList.landscape()),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
