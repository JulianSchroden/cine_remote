import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/live_view_cubit.dart';
import '../bloc/live_view_overlay_cubit.dart';
import 'live_view_autofocus_overlay.dart';
import 'live_view_center_marker_overlay.dart';
import 'live_view_control_overlay.dart';
import 'live_view_grid_guidelines_overlay.dart';

class LiveViewPlayer extends StatelessWidget {
  final List<Widget> children;
  const LiveViewPlayer({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveViewCubit, LiveViewState>(
      builder: (context, state) {
        final showGridOverlay = state.isLiveViewActive &&
            context.watch<LiveViewOverlayCubit>().state.showGrid;
        final showCenterMarkerOverlay = state.isLiveViewActive &&
            context.watch<LiveViewOverlayCubit>().state.showCenterMarker;
        final showTouchAutofocusOverlay =
            state.isLiveViewActive && state.supportsTouchAutofocus;

        return AspectRatio(
          aspectRatio: state.aspectRatio,
          child: state.isLiveViewSupported
              ? Stack(
                  children: [
                    if (state.imageBytes != null)
                      Image.memory(
                        state.imageBytes!,
                        gaplessPlayback: true,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ),
                    if (showGridOverlay) const LiveViewGridGuidelinesOverlay(),
                    if (showCenterMarkerOverlay)
                      const LiveViewCenterMarkerOverlay(),
                    LiveViewControlOverlay(
                      liveViewStatus: state.status,
                      isLoading: state.isLoading,
                    ),
                    if (showTouchAutofocusOverlay)
                      LiveViewAutofocusOverlay(
                        autofocusState: state.autofocusState,
                      ),
                    ...children,
                  ],
                )
              : const Center(
                  child: Text(
                    'LiveView not supported :(',
                    style: TextStyle(color: Color.fromARGB(255, 137, 137, 137)),
                    textAlign: TextAlign.center,
                  ),
                ),
        );
      },
    );
  }
}
