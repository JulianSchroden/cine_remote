import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cine_remote_colors.dart';
import '../../../core/widgets/laoding_overlay_layout.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../bloc/camera_control_layout_cubit.dart';

class CameraControlBaseLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget Function(BuildContext context, CameraControlLayoutState state)
      builder;

  const CameraControlBaseLayout({
    required this.builder,
    this.appBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: CineRemoteColors.background,
      body: BlocBuilder<CameraConnectionCubit, CameraConnectionState>(
        builder: (context, state) => LoadingOverlayLayout(
          backgroundColor: const Color.fromARGB(200, 0, 0, 0),
          overlayMessage: 'Disconnecting',
          showOverlay: state.maybeWhen(
            disconnecting: () => true,
            orElse: () => false,
          ),
          child:
              BlocBuilder<CameraControlLayoutCubit, CameraControlLayoutState>(
            builder: builder,
          ),
        ),
      ),
    );
  }
}
