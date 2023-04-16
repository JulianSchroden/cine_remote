import 'dart:convert';
import 'dart:io';

import '../../adapter/raw_datagram_socket_adapter.dart';
import 'upnp_advertisement_message.dart';

abstract class MessageType {
  const MessageType._();

  static const notify = 'NOTIFY * HTTP/1.1';
}

abstract class NotificationSubType {
  const NotificationSubType._();

  static const alive = 'ssdp:alive';
}

class UpnpDeviceDescription {}

class UpnpDiscoveryAdapter {
  static const upnpPort = 1900;
  final RawDatagramSocketFactory _socketFactory;

  UpnpDiscoveryAdapter({
    RawDatagramSocketFactory? socketFactory,
  }) : _socketFactory = socketFactory ?? const RawDatagramSocketFactory();

  Stream<UpnpAdvertisementMessage> discover() async* {
    final socket = await _socketFactory.bind(InternetAddress.anyIPv4, upnpPort);
    socket.joinMulticast(InternetAddress('239.255.255.250'));

    await for (final event in socket.stream) {
      if (event != RawSocketEvent.read) {
        continue;
      }

      final datagram = socket.receive();
      if (datagram == null) {
        continue;
      }

      final message = _processMessage(datagram);
      if (message != null) {
        yield message;
      }
    }
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
      }
    } catch (e) {
      return null;
    }

    return null;
  }
}
