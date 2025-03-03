import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image_capture_cubit.dart';
import 'capture_button.dart';

class CaptureBulbImageButton extends StatelessWidget {
  const CaptureBulbImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CaptureButton(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.elliptical(18, 20),
        ),
      ),
      color: Colors.white,
      onPressed: () => context.read<ImageCaptureCubit>().startBulbCapture(),
      onReleased: () => context.read<ImageCaptureCubit>().stopBulbCapture(),
    );
  }
}
