import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/camera_meta_cubit.dart';
import 'capture_image_button.dart';
import 'record_button.dart';

class ControlActionsBar extends StatelessWidget {
  final Orientation orientation;

  const ControlActionsBar({
    required this.orientation,
    super.key,
  });

  const ControlActionsBar.portrait({super.key})
      : orientation = Orientation.portrait;

  const ControlActionsBar.landscape({super.key})
      : orientation = Orientation.landscape;

  Widget _buildContainer({
    required BuildContext context,
    required List<Widget> children,
  }) {
    if (orientation == Orientation.portrait) {
      return Row(
        children: children,
      );
    }

    return Column(
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraMetaCubit, CameraMetaState>(
      builder: (context, state) => state.maybeWhen(
        updateSuccess: (descriptor) => _buildContainer(
          context: context,
          children: [
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
