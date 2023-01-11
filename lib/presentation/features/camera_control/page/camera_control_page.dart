import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependencies.dart';
import '../../../../domain/models/control_prop.dart';
import '../../../../domain/models/control_prop_type.dart';
import '../../../../domain/services/camera_remote_service.dart';
import '../../../../domain/services/date_time_adapter.dart';
import '../../../cine_remote_colors.dart';
import '../../../core/widgets/laoding_overlay_layout.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../bloc/actions_control_cubit.dart';
import '../bloc/props_control_cubit.dart';
import '../widgets/control_actions_bar.dart';
import '../widgets/control_prop_value_picker.dart';
import '../widgets/control_props_bar.dart';
import '../widgets/live_view_player.dart';
import '../widgets/record_button.dart';

class CameraControlPagePortrait extends StatefulWidget {
  const CameraControlPagePortrait({super.key});

  @override
  State<CameraControlPagePortrait> createState() =>
      _CameraControlPagePortraitState();
}

class _CameraControlPagePortraitState extends State<CameraControlPagePortrait> {
  ControlPropType? _selectedPropType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.read<CameraConnectionCubit>().disconnect(),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: CineRemoteColors.background,
      body: BlocBuilder<CameraConnectionCubit, CameraConnectionState>(
        builder: (context, state) => LoadingOverlayLayout(
          backgroundColor: const Color.fromARGB(200, 0, 0, 0),
          overlayMessage: 'Disconnecting',
          showOverlay: state.maybeWhen(
            disconnecting: () => true,
            orElse: () => false,
          ),
          child: SafeArea(
            child: Column(
              children: [
                const LiveViewPlayer(),
                const SizedBox(height: 16),
                ControlPropsBar.portrait(
                  selectedType: _selectedPropType,
                  onPropSelected: (propType) => setState(() {
                    if (_selectedPropType == propType) {
                      _selectedPropType = null;
                    } else {
                      _selectedPropType = propType;
                    }
                  }),
                ),
                Expanded(
                  child: _selectedPropType != null
                      ? Container(
                          color: Colors.grey[850],
                          child: ControlPropValuePicker(
                            selectedPropType: _selectedPropType!,
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
        ),
      ),
    );
  }
}

class CameraControlPageLandscape extends StatefulWidget {
  const CameraControlPageLandscape({super.key});

  @override
  State<CameraControlPageLandscape> createState() =>
      _CameraControlPageLandscapeState();
}

class _CameraControlPageLandscapeState
    extends State<CameraControlPageLandscape> {
  ControlPropType? _selectedPropType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SafeArea(
          right: false,
          child: SizedBox(
            width: 120,
            child: ControlPropsBar.landscape(
              selectedType: _selectedPropType,
              onPropSelected: (propType) => setState(() {
                if (_selectedPropType == propType) {
                  _selectedPropType = null;
                } else {
                  _selectedPropType = propType;
                }
              }),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              const SafeArea(
                left: false,
                child: LiveViewPlayer(
                  overlay: Align(
                    alignment: Alignment.centerRight,
                    child: RecordButton(),
                  ),
                ),
              ),
              if (_selectedPropType != null)
                Container(
                  color: Colors.grey[850],
                  child: SafeArea(
                    left: false,
                    child: ControlPropValuePicker(
                      selectedPropType: _selectedPropType!,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class CameraControlPage extends StatelessWidget {
  const CameraControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CameraConnectionCubit, CameraConnectionState>(
      listener: (context, state) {
        state.maybeWhen(
            disconnected: () => Navigator.of(context).pop(), orElse: () {});
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PropsControlCubit(
                context.read<CameraConnectionCubit>(),
                get<CameraRemoteService>(),
                get<DateTimeAdapter>())
              ..init(),
          ),
          BlocProvider(
            create: (context) => ActionsControlCubit(
              context.read<CameraConnectionCubit>(),
              get<CameraRemoteService>(),
            )..init(),
          ),
        ],
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return CameraControlPagePortrait();
          }

          return CameraControlPageLandscape();
        }),
      ),
    );
  }
}
