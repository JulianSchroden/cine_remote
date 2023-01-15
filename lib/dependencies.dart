import 'dart:async';

import 'domain/models/camera_model.dart';
import 'package:get_it/get_it.dart';

import 'config.dart';
import 'data/services/date_time_adapter_impl.dart';
import 'data/services/fake_camera_remote_service.dart';
import 'data/services/http_adapter.dart';
import 'data/services/wifi_camera_remote_service.dart';
import 'domain/services/camera_remote_service.dart';
import 'domain/services/date_time_adapter.dart';

void registerDependencies() {
  factory<HttpAdapter>(() => HttpAdapter());
  factory<DateTimeAdapter>(() => DateTimeAdapterImpl());
  singleton<Config>(() => Config());
  singleton<DependencyHelper>(() => DependencyHelper());
}

class DependencyHelper {
  CameraRemoteService registerCameraRemoteService(CameraModel cameraModel) {
    if (GetIt.instance.isRegistered<CameraRemoteService>()) {
      GetIt.instance.unregister<CameraRemoteService>();
    }

    final serviceImpl = _getCameraRemoteService(cameraModel);
    GetIt.instance
        .registerLazySingleton<CameraRemoteService>(() => serviceImpl);
    return serviceImpl;
  }

  CameraRemoteService _getCameraRemoteService(CameraModel cameraModel) {
    switch (cameraModel.identifier) {
      case CameraId.canonC100II:
        {
          return WifiCameraRemoteService(get<HttpAdapter>());
        }
      case CameraId.fakeCamera:
        {
          return FakeCameraRemoteService();
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
