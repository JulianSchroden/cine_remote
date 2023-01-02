import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../camera_connection/bloc/camera_connection_cubit.dart';
import 'control_prop_item.dart';

class ControlPropsBar extends StatelessWidget {
  const ControlPropsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraConnectionCubit, CameraConnectionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.maybeWhen(
                connectSuccess: (cameraHandle) => [
                  ...cameraHandle.supportedProps.map(
                    (propType) => ControlPropItem(controlPropType: propType),
                  )
                ],
                orElse: () => [],
              ),
            ],
          ),
        );
      },
    );
  }
}
