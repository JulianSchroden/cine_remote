import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/interface/camera.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

abstract class BaseCameraControlCubit<State> extends Cubit<State> {
  final CameraConnectionCubit cameraConnectionCubit;

  BaseCameraControlCubit(this.cameraConnectionCubit, super.initialState);

  Camera get camera => cameraConnectionCubit.camera;
}
