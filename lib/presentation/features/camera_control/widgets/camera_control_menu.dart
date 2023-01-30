import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cine_remote_colors.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

class CameraControlMenu extends StatelessWidget {
  final Color backgroundColor;
  final EdgeInsets? padding;
  final double width;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const CameraControlMenu({
    required this.backgroundColor,
    required this.width,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        color: backgroundColor,
        padding: padding,
        width: width,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: [
            TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all(CineRemoteColors.warning),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16))),
              onPressed: () =>
                  context.read<CameraConnectionCubit>().disconnect(),
              child: const Text('Disconnect'),
            ),
          ],
        ),
      );
}
