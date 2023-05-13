import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../adapter/raw_datagram_socket_adapter.dart';
import 'upnp_advertisement_message.dart';
import 'upnp_device_description.dart';
import 'upnp_device_description_parser.dart';

abstract class MessageType {
  const MessageType._();

  static const notify = 'NOTIFY * HTTP/1.1';
}

abstract class NotificationSubType {
  const NotificationSubType._();

  static const alive = 'ssdp:alive';
  static const byeBye = 'ssdp:byebye';
}

class UpnpDiscoveryAdapter {
  static const upnpPort = 1900;
  final ipv4MulticastAddress = InternetAddress('239.255.255.250');

  final RawDatagramSocketFactory _socketFactory;
  final UpnpDeviceDescriptionParser _deviceDescriptionParser;

  UpnpDiscoveryAdapter({
    RawDatagramSocketFactory? socketFactory,
    UpnpDeviceDescriptionParser? deviceDescriptionParser,
  })  : _socketFactory = socketFactory ?? const RawDatagramSocketFactory(),
        _deviceDescriptionParser =
            deviceDescriptionParser ?? const UpnpDeviceDescriptionParser();

  Stream<UpnpAdvertisementMessage> discover() {
    final controller = StreamController<UpnpAdvertisementMessage>();

    controller.onListen = () async {
      final socket =
          await _socketFactory.bind(InternetAddress.anyIPv4, upnpPort);
      socket.joinMulticast(ipv4MulticastAddress);

      controller.addStream(
        socket.stream.transform(
          StreamTransformer.fromHandlers(
            handleData: (event, sink) {
              if (event != RawSocketEvent.read) {
                return;
              }

              final datagram = socket.receive();
              if (datagram == null) {
                return;
              }

              final message = _processMessage(datagram);
              if (message != null) {
                sink.add(message);
              }
            },
          ),
        ),
      );

      controller.onCancel = () {
        socket.close();
      };
    };

    return controller.stream;
  }

  Future<UpnpDeviceDescription?> getDeviceDescription(String location) async {
    final response = await http.get(Uri.parse(location));

    return _deviceDescriptionParser.parse(location, response.body);
  }

  UpnpAdvertisementMessage? _processMessage(Datagram datagram) {
    final payload = utf8.decode(datagram.data);

    final lines = payload.split('\n');
    final messageHeader = lines.removeAt(0).toUpperCase().trim();
    if (messageHeader == MessageType.notify) {
      final entries = _parseEntries(lines);
      return _mapToMessage(entries);
    }

    return null;
  }

  Map<String, String> _parseEntries(List<String> lines) {
    final entryRegex = RegExp(r'\s*([\w-]*):\s*(.*)');
    final entries = <String, String>{};

    for (final line in lines) {
      final entryMatch = entryRegex.firstMatch(line);
      if (entryMatch == null || entryMatch.groupCount != 2) {
        continue;
      }

      final key = entryMatch.group(1)!.toUpperCase();
      final value = entryMatch.group(2)!;
      entries[key] = value;
    }

    return entries;
  }

  UpnpAdvertisementMessage? _mapToMessage(Map<String, String> entries) {
    try {
      final notifcationSubType = entries['NTS'];
      switch (notifcationSubType) {
        case NotificationSubType.alive:
          {
            return UpnpAdvertisementMessage.alive(
              serviceType: entries['NT']!,
              uniqueServiceName: entries['USN']!,
              location: entries['LOCATION']!,
            );
          }
        case NotificationSubType.byeBye:
          {
            return UpnpAdvertisementMessage.byeBye(
              serviceType: entries['NT']!,
              uniqueServiceName: entries['USN']!,
            );
          }
      }
    } catch (e) {
      return null;
    }

    return null;
  }
}
