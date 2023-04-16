import 'dart:io';

import 'package:cine_remote/camera_control/common/discovery/upnp/upnp_device_description.dart';
import 'package:cine_remote/camera_control/common/discovery/upnp/upnp_device_description_parser.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  const upnpLocation = 'http://192.168.0.120:49152/upnp/CameraDevDesc.xml';
  const validDescriptionPath =
      'test/_test_data/upnp_valid_device_description.xml';
  const invalidDescriptionPath =
      'test/_test_data/upnp_invalid_device_description.xml';
  late UpnpDeviceDescriptionParser sut;

  setUp(() {
    sut = const UpnpDeviceDescriptionParser();
  });

  String loadFile(String relativePath) {
    final file = File(relativePath);
    return file.readAsStringSync();
  }

  group('parse', () {
    test('returns parsed UpnpDeviceDescription', () {
      final xmlContent = loadFile(validDescriptionPath);
      final result = sut.parse(upnpLocation, xmlContent);

      expect(result, isA<UpnpDeviceDescription>());
    });

    test('parses address from location paramter', () {
      final xmlContent = loadFile(validDescriptionPath);
      final result = sut.parse(upnpLocation, xmlContent);

      expect(result, isNotNull);
      expect(result!.address, '192.168.0.120');
    });

    test('returns null when parsing address fails', () {
      final xmlContent = loadFile(validDescriptionPath);
      final result = sut.parse('https://1932.13123.1232.1232/dasd', xmlContent);

      expect(result, isNull);
    });

    test('parses modelName property', () {
      final xmlContent = loadFile(validDescriptionPath);
      final result = sut.parse(upnpLocation, xmlContent);

      expect(result, isNotNull);
      expect(result!.modelName, 'Canon EOS 70D');
    });

    test('parses uniqueDeviceName property', () {
      final xmlContent = loadFile(validDescriptionPath);
      final result = sut.parse(upnpLocation, xmlContent);

      expect(result, isNotNull);
      expect(
        result!.uniqueDeviceName,
        'uuid:00000000-0000-0000-0001-60128B7CC240',
      );
    });

    test('returns null when description is imcomplete', () {
      final invalidXmlContent = loadFile(invalidDescriptionPath);
      final result = sut.parse(upnpLocation, invalidXmlContent);

      expect(result, isNull);
    });
  });
}
