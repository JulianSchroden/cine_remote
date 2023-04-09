import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cine_remote_colors.dart';
import '../bloc/image_capture_cubit.dart';

class CaptureImageButton extends StatelessWidget {
  const CaptureImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.elliptical(18, 20),
        ),
      ),
      color: CineRemoteColors.primary,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => context.read<ImageCaptureCubit>().capture(),
        child: const SizedBox(
          width: 72,
          height: 72,
        ),
      ),
    );
  }
}
