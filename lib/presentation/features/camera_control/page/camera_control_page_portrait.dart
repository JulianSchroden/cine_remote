import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../../screen_orientation/bloc/screen_orientation_cubit.dart';
import '../bloc/camera_control_layout_cubit.dart';
import '../widgets/camera_control_base_layout.dart';
import '../widgets/control_actions_bar.dart';
import '../widgets/control_prop_value_picker.dart';
import '../widgets/control_props_bar.dart';
import '../widgets/live_view_player.dart';

class CameraControlPagePortrait extends StatelessWidget {
  const CameraControlPagePortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return CameraControlBaseLayout(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.read<CameraConnectionCubit>().disconnect(),
        ),
        backgroundColor: Colors.black,
      ),
      builder: (context, state) => SafeArea(
        child: Column(
          children: [
            LiveViewPlayer(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () => context
                        .read<ScreenOrientationCubit>()
                        .setForcedOrientation(Orientation.landscape),
                    icon: const Icon(
                      Icons.fullscreen,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ControlPropsBar.portrait(
              selectedType: state.activePropType,
              onPropSelected: (propType) {
                context.read<CameraControlLayoutCubit>().setActivePropType(
                    state.activePropType == propType ? null : propType);
              },
            ),
            Expanded(
              child: state.activePropType != null
                  ? Container(
                      color: Colors.grey[850],
                      child: ControlPropValuePicker.grid(
                        propType: state.activePropType!,
                      ),
                    )
                  : Container(),
            ),
            const SizedBox(height: 32),
            const ControlActionsBar(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
