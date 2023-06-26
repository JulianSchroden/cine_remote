import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cine_remote_colors.dart';
import '../../../camera_connection/bloc/camera_connection_cubit.dart';
import '../../../live_view/bloc/live_view_cubit.dart';
import '../../../live_view/bloc/live_view_overlay_cubit.dart';
import 'switch_menu_item.dart';

class CameraControlMenu extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  const CameraControlMenu({
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LiveViewCubit, LiveViewState>(
        builder: (context, liveViewState) => ListView(
          children: [
            if (liveViewState.isLiveViewSupported)
              SwitchMenuItem(
                value: liveViewState.isLiveViewActive,
                onChanged: (_) =>
                    context.read<LiveViewCubit>().toggleLiveView(),
                title: 'LiveView',
              ),
            SwitchMenuItem(
              value:
                  context.watch<LiveViewOverlayCubit>().state.showCenterMarker,
              onChanged: (value) => context
                  .read<LiveViewOverlayCubit>()
                  .setCenterMarkerEnabled(value),
              title: 'Center Marker',
            ),
            SwitchMenuItem(
              value: context.watch<LiveViewOverlayCubit>().state.showGrid,
              onChanged: (value) =>
                  context.read<LiveViewOverlayCubit>().setGridEnabled(value),
              title: 'Grid',
            ),
            const SizedBox(height: 16),
            TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all(CineRemoteColors.warning),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16))),
              onPressed: () =>
                  context.read<CameraConnectionCubit>().disconnect(),
              child: const Text('Disconnect'),
            ),
          ],
        ),
      );
}
