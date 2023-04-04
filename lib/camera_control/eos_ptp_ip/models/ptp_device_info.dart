import 'package:freezed_annotation/freezed_annotation.dart';

part 'ptp_device_info.freezed.dart';

@freezed
class PtpDeviceInfo with _$PtpDeviceInfo {
  const factory PtpDeviceInfo({
    required int standardVersion,
    required int vendorExtensionId,
    required int vendorExtensionVersion,
    required String vendorExtensionDescription,
    required int functionalMode,
    required List<int> operations,
    required List<int> events,
    required List<int> properties,
    required List<int> captureFormats,
    required List<int> imageFormats,
    required String manufacturer,
    required String model,
    required String deviceVersion,
    required String serialNumber,
  }) = _PtpDeviceInfo;
}
