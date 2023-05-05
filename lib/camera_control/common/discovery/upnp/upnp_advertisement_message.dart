import 'package:equatable/equatable.dart';

class UpnpAdvertisementMessage extends Equatable {
  const factory UpnpAdvertisementMessage.alive({
    required String serviceType,
    required String uniqueServiceName,
    required String location,
  }) = UpnpAdvertisementAlive;

  const factory UpnpAdvertisementMessage.update({
    required String serviceType,
    required String uniqueServiceName,
    required String location,
  }) = UpnpAdvertisementUpdate;

  const factory UpnpAdvertisementMessage.byeBye({
    required String serviceType,
    required String uniqueServiceName,
  }) = UpnpAdvertisementByeBye;

  final String serviceType;
  final String uniqueServiceName;

  String get uniqueDeviceName => uniqueServiceName.split('::').first;

  const UpnpAdvertisementMessage({
    required this.serviceType,
    required this.uniqueServiceName,
  });

  @override
  List<Object?> get props => [
        serviceType,
        uniqueServiceName,
      ];
}

class UpnpAdvertisementAlive extends UpnpAdvertisementMessage {
  /// URL to gain information about the advertised service.
  final String location;

  const UpnpAdvertisementAlive({
    required super.serviceType,
    required super.uniqueServiceName,
    required this.location,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        location,
      ];

  @override
  String toString() {
    return 'UpnpAdvertisementAlive(serviceType: $serviceType, uniqueServiceName: $uniqueServiceName, location: $location)';
  }
}

class UpnpAdvertisementUpdate extends UpnpAdvertisementMessage {
  /// URL to gain information about the updated service.
  final String location;

  const UpnpAdvertisementUpdate({
    required super.serviceType,
    required super.uniqueServiceName,
    required this.location,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        location,
      ];

  @override
  String toString() {
    return 'UpnpAdvertisementUpdate(serviceType: $serviceType, uniqueServiceName: $uniqueServiceName, location: $location)';
  }
}

class UpnpAdvertisementByeBye extends UpnpAdvertisementMessage {
  const UpnpAdvertisementByeBye({
    required super.serviceType,
    required super.uniqueServiceName,
  });

  @override
  String toString() {
    return 'UpnpAdvertisementByeBye(serviceType: $serviceType, uniqueServiceName: $uniqueServiceName)';
  }
}
