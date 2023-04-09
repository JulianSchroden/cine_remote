import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/common/adapter/date_time_adapter.dart';
import '../../../../dependencies.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../../live_view/bloc/live_view_cubit.dart';
import '../../screen_orientation/bloc/screen_orientation_cubit.dart';
import '../bloc/actions_control_cubit.dart';
import '../bloc/camera_control_layout_cubit.dart';
import '../bloc/camera_meta_cubit.dart';
import '../bloc/props_control_cubit.dart';
import 'camera_control_page_landscape.dart';
import 'camera_control_page_portrait.dart';

class CameraControlPage extends StatelessWidget {
  const CameraControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PropsControlCubit(
              context.read<CameraConnectionCubit>(), get<DateTimeAdapter>())
            ..init(),
        ),
        BlocProvider(
          create: (context) => ActionsControlCubit(
            context.read<CameraConnectionCubit>(),
          )..init(),
        ),
        BlocProvider(
          create: (context) => CameraControlLayoutCubit(),
        ),
        BlocProvider(
          create: (context) => LiveViewCubit(
            context.read<CameraConnectionCubit>(),
          )..init(),
        ),
        BlocProvider(
          create: (context) => CameraMetaCubit(
            context.read<CameraConnectionCubit>(),
          )..init(),
        )
      ],
      child: BlocListener<CameraConnectionCubit, CameraConnectionState>(
        listener: (context, state) {
          state.maybeWhen(
              disconnected: () async {
                context
                    .read<ScreenOrientationCubit>()
                    .setForcedOrientation(null);
                Navigator.of(context).pop();
              },
              orElse: () {});
        },
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return const CameraControlPagePortrait();
          }

          return const CameraControlPageLandscape();
        }),
      ),
    );
  }
}
