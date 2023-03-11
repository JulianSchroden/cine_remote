import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config.dart';
import 'dependencies.dart';
import 'presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'presentation/features/camera_control/page/camera_control_page.dart';
import 'presentation/features/camera_selection/page/camera_selection_page.dart';
import 'presentation/features/screen_orientation/bloc/screen_orientation_cubit.dart';
import 'presentation/routes.dart';

void main() {
  registerDependencies();
  runApp(const CineRemote());
}

class CineRemote extends StatelessWidget {
  const CineRemote({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CameraConnectionCubit(),
        ),
        BlocProvider(
          create: (_) => ScreenOrientationCubit()..setForcedOrientation(null),
        )
      ],
      child: MaterialApp(
        title: 'Cine Remote',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          Routes.cameraSelection: (_) =>
              CameraSelectionPage(config: get<Config>()),
          Routes.cameraControl: (_) => const CameraControlPage(),
        },
        initialRoute: Routes.cameraSelection,
      ),
    );
  }
}
