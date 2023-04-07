import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/screen_orientation_cubit.dart';

class ForceOrientationButton extends StatelessWidget {
  final Orientation forceTo;

  const ForceOrientationButton({
    required this.forceTo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () =>
          context.read<ScreenOrientationCubit>().setForcedOrientation(forceTo),
      icon: const Icon(
        Icons.fullscreen,
        color: Colors.white,
      ),
    );
  }
}
