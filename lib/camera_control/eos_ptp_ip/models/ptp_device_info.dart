import 'package:equatable/equatable.dart';

class PtpDeviceInfo extends Equatable {
  final int standardVersion;
  final int vendorExtensionId;
  final int vendorExtensionVersion;
  final String vendorExtensionDescription;
  final int functionalMode;
  final List<int> operations;
  final List<int> events;
  final List<int> properties;
  final List<int> captureFormats;
  final List<int> imageFormats;
  final String manufacturer;
  final String model;
  final String deviceVersion;
  final String serialNumber;

  const PtpDeviceInfo({
    required this.standardVersion,
    required this.vendorExtensionId,
    required this.vendorExtensionVersion,
    required this.vendorExtensionDescription,
    required this.functionalMode,
    required this.operations,
    required this.events,
    required this.properties,
    required this.captureFormats,
    required this.imageFormats,
    required this.manufacturer,
    required this.model,
    required this.deviceVersion,
    required this.serialNumber,
  });

  @override
  List<Object?> get props => [
        standardVersion,
        vendorExtensionId,
        vendorExtensionVersion,
        vendorExtensionDescription,
        functionalMode,
        operations,
        events,
        properties,
        captureFormats,
        imageFormats,
        manufacturer,
        model,
        deviceVersion,
        serialNumber,
      ];
}
