import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependencies.dart';
import 'presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'presentation/features/camera_control/page/camera_control_page.dart';
import 'presentation/features/camera_pairing/bloc/camera_pairing_cubit.dart';
import 'presentation/features/camera_pairing/pages/camera_pairing_page.dart';
import 'presentation/features/camera_pairing/pages/manual_camera_pairing_page.dart';
import 'presentation/features/camera_selection/page/camera_selection_page.dart';
import 'presentation/features/recent_cameras/bloc/recent_cameras_cubit.dart';
import 'presentation/features/screen_orientation/bloc/screen_orientation_cubit.dart';
import 'presentation/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(const CineRemote());
}

class CineRemote extends StatelessWidget {
  const CineRemote({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => get<CameraConnectionCubit>(),
        ),
        BlocProvider(
          create: (context) => get<CameraPairingCubit>(),
        ),
        BlocProvider(
          create: (_) => ScreenOrientationCubit()..setForcedOrientation(null),
        ),
        BlocProvider(
          create: (context) => get<RecentCamerasCubit>()..load(),
        ),
      ],
      child: MaterialApp(
        title: 'Cine Remote',
        theme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Colors.green,
            background: Colors.grey[850]!,
          ),
        ),
        routes: {
          Routes.cameraSelection: (_) => const CameraSelectionPage(),
          Routes.cameraPairing: (_) => const CameraPairingPage(),
          Routes.manualCameraPairing: (_) => const ManualCameraPairingPage(),
          Routes.cameraControl: (_) => const CameraControlPage(),
        },
        initialRoute: Routes.cameraSelection,
      ),
    );
  }
}
