import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image_capture_cubit.dart';
import 'capture_button.dart';

class CaptureImageButton extends StatelessWidget {
  const CaptureImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CaptureButton(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.elliptical(18, 20),
        ),
      ),
      onPressed: () => context.read<ImageCaptureCubit>().capture(),
    );
  }
}
