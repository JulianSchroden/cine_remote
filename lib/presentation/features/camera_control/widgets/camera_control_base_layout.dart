import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cine_remote_colors.dart';
import '../../../core/widgets/laoding_overlay_layout.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../bloc/camera_control_layout_cubit.dart';

class CameraControlBaseLayout extends StatelessWidget {
  final PreferredSizeWidget Function(
      BuildContext context, CameraControlLayoutState state)? appBarBuilder;
  final Widget Function(BuildContext context, CameraControlLayoutState state)
      builder;

  const CameraControlBaseLayout({
    required this.builder,
    this.appBarBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraConnectionCubit, CameraConnectionState>(
      builder: (context, state) =>
          BlocBuilder<CameraControlLayoutCubit, CameraControlLayoutState>(
        builder: (context, layoutState) => Scaffold(
          appBar: appBarBuilder?.call(context, layoutState),
          backgroundColor: CineRemoteColors.background,
          body: LoadingOverlayLayout(
              backgroundColor: const Color.fromARGB(200, 0, 0, 0),
              overlayMessage: 'Disconnecting',
              showOverlay: state.maybeWhen(
                disconnecting: () => true,
                orElse: () => false,
              ),
              child: builder(context, layoutState)),
        ),
      ),
    );
  }
}
