import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import 'camera_control/eos_ptp_ip/logging/eos_ptp_ip_logger_topics.dart';
import 'camera_control/interface/camera_factory_provider.dart';
import 'camera_control/interface/discovery/camera_discovery_service.dart';
import 'camera_control/interface/logging/camera_control_logger.dart';
import 'presentation/core/adapter/date_time_adapter.dart';
import 'presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'presentation/features/camera_selection/bloc/camera_discovery_cubit.dart';
import 'presentation/features/recent_cameras/bloc/recent_cameras_cubit.dart';
import 'presentation/features/recent_cameras/repository/recent_cameras_repository.dart';

void registerDependencies() {
  factory<DateTimeAdapter>(() => const DateTimeAdapter());
  singleton<HiveAdapter>(() => const HiveAdapter());
  singleton<RecentCamerasRepostitory>(
      () => RecentCamerasRepostitory(get<HiveAdapter>()));

  factory<CameraConnectionCubit>(() => CameraConnectionCubit(
        cameraFactoryProvider: const CameraFactoryProvider(),
        recentCamerasRepostitory: get<RecentCamerasRepostitory>(),
      ));
  factory<CameraDiscoveryCubit>(
      () => CameraDiscoveryCubit(CameraDiscoveryService.create()));
  factory<RecentCamerasCubit>(
      () => RecentCamerasCubit(get<RecentCamerasRepostitory>()));
}

Future<void> setup() async {
  setupLogging();
  await setupHive();
}

void setupLogging() {
  CameraControlLoggerConfig.init(enabledTopics: [
    const EosPtpTransactionQueueTopic(),
  ]);

  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

Future<void> setupHive() => get<HiveAdapter>().init();

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
