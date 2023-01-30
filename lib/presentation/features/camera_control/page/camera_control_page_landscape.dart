import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../../screen_orientation/bloc/screen_orientation_cubit.dart';
import '../bloc/camera_control_layout_cubit.dart';
import '../widgets/camera_control_base_layout.dart';
import '../widgets/control_prop_value_picker.dart';
import '../widgets/control_props_bar.dart';
import '../../live_view/widgets/live_view_player.dart';
import '../widgets/record_button.dart';

class CameraControlPageLandscape extends StatelessWidget {
  const CameraControlPageLandscape({super.key});

  @override
  Widget build(BuildContext context) => CameraControlBaseLayout(
        builder: (context, state) => Row(
          children: [
            SafeArea(
              right: false,
              child: SizedBox(
                width: 120,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => context
                            .read<CameraControlLayoutCubit>()
                            .toggleMenu(),
                        child: const Text(
                          'Menu',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: ControlPropsBar.landscape(
                          selectedType: state.activePropType,
                          onPropSelected: (propType) {
                            context
                                .read<CameraControlLayoutCubit>()
                                .setActivePropType(
                                    state.activePropType == propType
                                        ? null
                                        : propType);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  SafeArea(
                    top: false,
                    bottom: false,
                    left: false,
                    child: LiveViewPlayer(children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: RecordButton(),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () => context
                              .read<ScreenOrientationCubit>()
                              .setForcedOrientation(Orientation.portrait),
                          icon: const Icon(
                            Icons.fullscreen,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  if (state.activePropType != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Colors.grey[850],
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 16,
                          bottom: MediaQuery.of(context).padding.bottom + 16,
                        ),
                        alignment: Alignment.center,
                        width: 150,
                        child: ControlPropValuePicker.list(
                          propType: state.activePropType!,
                        ),
                      ),
                    ),
                  if (state.showMenu)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Colors.grey[850],
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 16,
                          bottom: MediaQuery.of(context).padding.bottom + 16,
                        ),
                        width: 150,
                        child: Column(
                          children: [
                            TextButton(
                              child: const Text('Disconnect'),
                              onPressed: () => context
                                  .read<CameraConnectionCubit>()
                                  .disconnect(),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}
