import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cine_remote_colors.dart';
import '../bloc/actions_control_cubit.dart';
import 'capture_button.dart';

class CaptureMovieButton extends StatelessWidget {
  const CaptureMovieButton({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ActionsControlCubit, ActionsControlState>(
        builder: (context, state) => CaptureButton(
          shape: const CircleBorder(),
          color: state.actionsState.isRecording
              ? Colors.red
              : CineRemoteColors.primary,
          onPressed: () {
            context.read<ActionsControlCubit>().triggerRecord();
          },
        ),
      );
}
