import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_device_info_parser.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/models/ptp_device_info.dart';
import 'package:flutter_test/flutter_test.dart';

import '../packet_helper.dart';
part 'ptp_device_info_parser_test.data.dart';

void main() {
  late PtpDeviceInfoParser sut;

  setUp(() {
    sut = const PtpDeviceInfoParser();
  });

  group('parseData', () {
    test('returns instance of PtpDeviceInfo', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result, isA<PtpDeviceInfo>());
    });

    test('parses standardVersion', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.standardVersion, 0x64);
    });

    test('parses vendorExtensionId', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.vendorExtensionId, 0x06);
    });

    test('parses vendorExtensionVersion', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.vendorExtensionVersion, 0x64);
    });

    test('parses vendorExtensionDescription', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.vendorExtensionDescription, '');
    });

    test('parses functionalMode', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.functionalMode, 0x0);
    });

    test('parses operation codes', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.operations.length, 169);
      expect(result.operations, containsAll([0x1001, 0x9110, 0x905f]));
    });

    test('parses event codes', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.events.length, 7);
      expect(result.events, containsAll([0x4009, 0x4005, 0xc101]));
    });

    test('parses property codes', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.properties.length, 6);
      expect(result.properties, containsAll([0xd049, 0xd407, 0x5001]));
    });

    test('parses captureFormats', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.captureFormats.length, 1);
      expect(result.captureFormats, containsAll([0x3801]));
    });

    test('parses image formats', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.imageFormats.length, 12);
      expect(result.imageFormats, containsAll([0x3001, 0x3801, 0xb105]));
    });

    test('parses manufacturer name', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.manufacturer, 'Canon Inc.');
    });

    test('parses model name', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.model, 'Canon EOS 70D');
    });

    test('parses device version', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.deviceVersion, '3-1.1.1');
    });

    test('parses serial number', () {
      final result = sut.parseData(getDeviceInfoResponse);

      expect(result.serialNumber, '7d189da35c17466ca7f9ea49537ce634');
    });
  });
}
