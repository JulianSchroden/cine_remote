import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependencies.dart';
import '../../../../domain/services/camera_remote_service.dart';
import '../../../../domain/services/date_time_adapter.dart';
import '../../../cine_remote_colors.dart';
import '../../../core/widgets/laoding_overlay_layout.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../bloc/actions_control_cubit.dart';
import '../bloc/props_control_cubit.dart';
import '../widgets/control_actions_bar.dart';
import '../widgets/control_props_bar.dart';
import '../widgets/live_view_image.dart';

class CameraControlPage extends StatelessWidget {
  const CameraControlPage({super.key});

  Widget _buildPortraitLayout(BuildContext context) {
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
              children: const [
                LiveViewImage(),
                Expanded(child: ControlPropsBar()),
                SizedBox(height: 32),
                ControlActionsBar(),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Container();
  }

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
            return _buildPortraitLayout(context);
          }

          return _buildLandscapeLayout(context);

          /*
              return SafeArea(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.close),
                            color: Colors.white,
                          ),
                        ),
                        const Expanded(
                          child: ControlPropsBar(),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          AspectRatio(aspectRatio: 16 / 9, child: Placeholder()),
                          //if (imageBytes != null)
                          //  Image.memory(
                          //    imageBytes!,
                          //    fit: BoxFit.contain,
                          //    gaplessPlayback: true,
                          //  ),
                          MaterialButton(
                            shape: const CircleBorder(),
                            color: Colors.green,
                            onPressed: () {}, //_triggerRecord,
                            child: const SizedBox(
                              width: 72,
                              height: 72,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              */
        }),
      ),
    );
  }
}
