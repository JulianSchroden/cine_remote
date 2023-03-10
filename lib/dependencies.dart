import 'dart:async';

import 'package:cine_remote/camera_control/eos_ptp_ip/eos_ptp_ip_camera.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import 'camera_control/common/date_time_adapter.dart';
import 'camera_control/demo/demo_camera_remote_client.dart';
import 'camera_control/eos_cine_http/eos_cine_http_remote_client.dart';
import 'camera_control/eos_cine_http/services/http_adapter.dart';
import 'camera_control/interface/camera_remote_client.dart';
import 'camera_control/interface/models/camera_model.dart';
import 'config.dart';

void registerDependencies() {
  factory<HttpAdapter>(() => HttpAdapter());
  factory<DateTimeAdapter>(() => DateTimeAdapterImpl());
  singleton<Config>(() => Config());
  singleton<DependencyHelper>(() => DependencyHelper());

  setupLogging();
}

void setupLogging() {
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

class DependencyHelper {
  CameraRemoteClient registerCameraRemoteService(CameraModel cameraModel) {
    if (GetIt.instance.isRegistered<CameraRemoteClient>()) {
      GetIt.instance.unregister<CameraRemoteClient>();
    }

    final serviceImpl = _getCameraRemoteService(cameraModel);
    GetIt.instance.registerLazySingleton<CameraRemoteClient>(() => serviceImpl);
    return serviceImpl;
  }

  CameraRemoteClient _getCameraRemoteService(CameraModel cameraModel) {
    switch (cameraModel.identifier) {
      case CameraId.fakeCamera:
        {
          return FakeCameraRemoteService();
        }
      case CameraId.canonC100II:
        {
          return EosCineHttpRemoteClient(get<HttpAdapter>());
        }
      case CameraId.canon70D:
        {
          return EosPtpIpCamera();
        }
      default:
        {
          throw Exception(
              'No CameraRemoteService registered for identifier: ${cameraModel.identifier}');
        }
    }
  }
}

T get<T extends Object>({dynamic param1, dynamic param2}) {
  if (GetIt.instance.isRegistered<T>()) {
    return GetIt.instance.get<T>(param1: param1, param2: param2);
  }

  throw Exception('get<$T>: not registered');
}

void factory<T extends Object>(T Function() constructor) {
  GetIt.instance.registerFactory<T>(constructor);
}

void singleton<T extends Object>(T Function() constructor,
    [FutureOr<dynamic> Function(T)? dispose]) {
  GetIt.instance.registerLazySingleton<T>(constructor, dispose: dispose);
}
