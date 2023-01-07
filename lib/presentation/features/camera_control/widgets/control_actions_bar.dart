import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependencies.dart';
import '../../../../domain/services/camera_remote_service.dart';
import '../../../cine_remote_colors.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../bloc/actions_control_cubit.dart';

class ControlActionsBar extends StatelessWidget {
  const ControlActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActionsControlCubit(
          context.read<CameraConnectionCubit>(), get<CameraRemoteService>()),
      child: BlocBuilder<ActionsControlCubit, ActionsControlState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: Center(
                  child: TextButton(
                    onPressed: () =>
                        context.read<ActionsControlCubit>().toggleAfLock(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'AF-Lock',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: state.actionsState.isAfLocked
                              ? TextDecoration.none
                              : TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  shape: const CircleBorder(),
                  color: state.actionsState.isRecording
                      ? Colors.red
                      : CineRemoteColors.primary,
                  onPressed: () {
                    context.read<ActionsControlCubit>().triggerRecord();
                  },
                  child: const SizedBox(
                    width: 72,
                    height: 72,
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          );
        },
      ),
    );
  }
}
