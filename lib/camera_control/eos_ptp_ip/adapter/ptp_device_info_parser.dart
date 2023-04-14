import 'dart:typed_data';

import '../models/ptp_device_info.dart';
import 'ptp_packet_reader.dart';

class PtpDeviceInfoParser {
  const PtpDeviceInfoParser();

  PtpDeviceInfo parseData(Uint8List data) {
    final reader = PtpPacketReader.fromBytes(data);
    final standardVersion = reader.getUint16();
    final vendorExtensionId = reader.getUint32();
    final vendorExtensionVersion = reader.getUint16();
    final vendorExtensionDescription = readString(reader);
    final functionalMode = reader.getUint16();
    final operations = readValues(reader);
    final events = readValues(reader);
    final properties = readValues(reader);
    final captureFormats = readValues(reader);
    final imageFormats = readValues(reader);
    final manufacturer = readString(reader);
    final model = readString(reader);
    final deviceVersion = readString(reader);
    final serialNumber = readString(reader);

    return PtpDeviceInfo(
      standardVersion: standardVersion,
      vendorExtensionId: vendorExtensionId,
      vendorExtensionVersion: vendorExtensionVersion,
      vendorExtensionDescription: vendorExtensionDescription,
      functionalMode: functionalMode,
      operations: operations,
      events: events,
      properties: properties,
      captureFormats: captureFormats,
      imageFormats: imageFormats,
      manufacturer: manufacturer,
      model: model,
      deviceVersion: deviceVersion,
      serialNumber: serialNumber,
    );
  }

  String readString(PtpPacketReader reader) {
    final length = reader.getUint8();
    if (length == 0) {
      return '';
    }

    return reader.getString();
  }

  List<int> readValues(PtpPacketReader reader) {
    final length = reader.getUint32();
    final valueList = <int>[];
    for (int i = 0; i < length; i++) {
      final value = reader.getUint16();
      valueList.add(value);
    }
    return valueList;
  }
}
