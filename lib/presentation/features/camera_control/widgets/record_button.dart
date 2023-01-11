import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cine_remote_colors.dart';
import '../bloc/actions_control_cubit.dart';

class RecordButton extends StatelessWidget {
  const RecordButton({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ActionsControlCubit, ActionsControlState>(
        builder: (context, state) => MaterialButton(
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
      );
}
