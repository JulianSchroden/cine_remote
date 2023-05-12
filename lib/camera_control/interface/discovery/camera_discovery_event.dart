import 'package:equatable/equatable.dart';

import 'discovery_handle.dart';

abstract class CameraDiscoveryEvent extends Equatable {
  const factory CameraDiscoveryEvent.alive({
    required DiscoveryHandle handle,
  }) = CameraDiscoveryEventAlive;

  const factory CameraDiscoveryEvent.byeBye({
    required String id,
  }) = CameraDiscoveryEventByeBye;

  String get id;

  const CameraDiscoveryEvent();

  @override
  List<Object?> get props => [
        id,
      ];
}

class CameraDiscoveryEventAlive extends CameraDiscoveryEvent {
  final DiscoveryHandle handle;

  const CameraDiscoveryEventAlive({
    required this.handle,
  });

  @override
  String get id => handle.id;

  @override
  List<Object?> get props => [
        ...super.props,
        handle,
      ];
}

class CameraDiscoveryEventByeBye extends CameraDiscoveryEvent {
  @override
  final String id;

  const CameraDiscoveryEventByeBye({
    required this.id,
  });
}
