import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/interface/models/properties/camera_mode.dart';
import '../bloc/camera_meta_cubit.dart';
import 'capture_image_button.dart';
import 'record_button.dart';

class ControlActionsBar extends StatelessWidget {
  const ControlActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraMetaCubit, CameraMetaState>(
      builder: (context, state) => state.maybeWhen(
        updateSuccess: (descriptor) => Row(
          children: [
            //Expanded(
            //  child: Center(
            //    child: TextButton(
            //      onPressed: () =>
            //          context.read<ActionsControlCubit>().toggleAfLock(),
            //      child: Padding(
            //        padding: const EdgeInsets.all(8.0),
            //        child: Text(
            //          'AF-Lock',
            //          style: TextStyle(
            //            color: Colors.white,
            //            decoration: state.actionsState.isAfLocked
            //                ? TextDecoration.none
            //                : TextDecoration.lineThrough,
            //          ),
            //        ),
            //      ),
            //    ),
            //  ),
            //),

            const Spacer(),

            descriptor.mode is PhotoMode
                ? const CaptureImageButton()
                : const RecordButton(),

            const Spacer(),
          ],
        ),
        orElse: () => Container(),
      ),
    );
  }
}
