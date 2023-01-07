import 'dart:async';

import 'package:get_it/get_it.dart';

import 'data/services/http_adapter.dart';
import 'data/services/wifi_camera_remote_service.dart';
import 'domain/services/camera_remote_service.dart';

void registerDependencies() {
  factory<HttpAdapter>(() => HttpAdapter());
  singleton<CameraRemoteService>(
      () => WifiCameraRemoteService(get<HttpAdapter>()));
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
