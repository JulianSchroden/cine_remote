import 'package:xml/xml.dart';

import 'upnp_device_description.dart';

class UpnpDeviceDescriptionParser {
  const UpnpDeviceDescriptionParser();

  UpnpDeviceDescription? parse(String location, String xmlContent) {
    try {
      final address = parseAddress(location);
      if (address == null) return null;

      final document = XmlDocument.parse(xmlContent);

      final deviceElement = document.findFirstRecursive('device');
      final modelName = deviceElement.findFirst('modelName').innerText;
      final uniqueDeviceName = deviceElement.findFirst('UDN').innerText;

      return UpnpDeviceDescription(
        address: address,
        modelName: modelName,
        uniqueDeviceName: uniqueDeviceName,
      );
    } catch (e) {
      return null;
    }
  }

  String? parseAddress(String location) {
    final locationRegex =
        RegExp(r'http:\/\/([\d]{1,3}.\d{1,3}.\d{1,3}.\d{1,3}).*');
    final locationMatch = locationRegex.firstMatch(location);
    return locationMatch?.group(1);
  }
}

extension FindFirstExtension on XmlNode {
  XmlElement findFirst(String name) => findElements(name).first;
  XmlElement findFirstRecursive(String name) => findAllElements(name).first;
}
