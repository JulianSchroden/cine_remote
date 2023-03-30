import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import 'camera_control/common/adapter/date_time_adapter.dart';
import 'camera_control/eos_ptp_ip/constants/ptp_property.dart';
import 'camera_control/eos_ptp_ip/logging/eos_ptp_ip_logger_topics.dart';
import 'camera_control/interface/logging/camera_control_logger.dart';
import 'config.dart';

void registerDependencies() {
  factory<DateTimeAdapter>(() => const DateTimeAdapterImpl());
  singleton<Config>(() => Config());

  setupLogging();
}

void setupLogging() {
  CameraControlLoggerConfig.init(enabledTopics: [
    EosPtpIpLoggerTopics.rawEvents(
      dumpDataAsValidList: true,
      dumpDataWithLineNumbers: true,
    ),
    EosPtpIpLoggerTopics.propertyChangedEvents(
      propsBlackList: [0xd1d5, 0xd1d9],
      propsWhitelist: [PtpPropertyCode.iso],
    ),
  ]);

  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
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
