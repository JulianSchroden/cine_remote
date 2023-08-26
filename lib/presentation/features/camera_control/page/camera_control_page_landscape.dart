import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cine_remote_colors.dart';
import '../../live_view/widgets/live_view_player.dart';
import '../../screen_orientation/widgets/force_orientation_button.dart';
import '../bloc/camera_control_layout_cubit.dart';
import '../widgets/camera_control_base_layout.dart';
import '../widgets/control_actions_bar.dart';
import '../widgets/control_prop_item.dart';
import '../widgets/control_prop_value_picker.dart';
import '../widgets/control_props_bar.dart';
import '../widgets/menu/camera_control_menu.dart';

class CameraControlPageLandscape extends StatelessWidget {
  const CameraControlPageLandscape({super.key});

  @override
  Widget build(BuildContext context) => CameraControlBaseLayout(
        builder: (context, state) => Row(
          children: [
            SafeArea(
              right: false,
              minimum: const EdgeInsets.only(left: 8),
              child: Container(
                width: 120,
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ControlPropItem(
                      data: 'Menu',
                      onPressed: () =>
                          context.read<CameraControlLayoutCubit>().toggleMenu(),
                      style: const ControlPropItemStyle.square(),
                      isSelected: state.showMenu,
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
            Expanded(
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  const LiveViewPlayer(children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child:
                          ForceOrientationButton(forceTo: Orientation.portrait),
                    ),
                  ]),
                  if (state.activePropType != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: CineRemoteColors.overlayBackground,
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
                        color: CineRemoteColors.overlayBackground,
                        width: 200,
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 16,
                          right: 12,
                          bottom: MediaQuery.of(context).padding.bottom + 16,
                          left: 12,
                        ),
                        child: const CameraControlMenu(),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const SafeArea(
              left: false,
              minimum: EdgeInsets.only(right: 16),
              child: ControlActionsBar.landscape(),
            )
          ],
        ),
      );
}
