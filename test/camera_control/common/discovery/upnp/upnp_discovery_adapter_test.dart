import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cine_remote/camera_control/common/adapter/raw_datagram_socket_adapter.dart';
import 'package:cine_remote/camera_control/common/discovery/upnp/upnp_advertisement_message.dart';
import 'package:cine_remote/camera_control/common/discovery/upnp/upnp_discovery_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRawDatagramSocketFactory extends Mock
    implements RawDatagramSocketFactory {}

class MockRawDatagramSocketAdapter extends Mock
    implements RawDatagramSocketAdapter {}

void main() {
  late UpnpDiscoveryAdapter sut;
  late MockRawDatagramSocketFactory mockRawDatagramSocketFactory;
  late MockRawDatagramSocketAdapter mockRawDatagramSocketAdapter;
  late StreamController<RawSocketEvent> eventStreamController;

  setUp(() {
    mockRawDatagramSocketFactory = MockRawDatagramSocketFactory();
    mockRawDatagramSocketAdapter = MockRawDatagramSocketAdapter();
    eventStreamController = StreamController<RawSocketEvent>();

    when(() => mockRawDatagramSocketAdapter.stream)
        .thenAnswer((_) => eventStreamController.stream);

    when(() => mockRawDatagramSocketFactory.bind(any(), any()))
        .thenAnswer((_) => Future.value(mockRawDatagramSocketAdapter));

    sut = UpnpDiscoveryAdapter(socketFactory: mockRawDatagramSocketFactory);
  });

  void setupDatagram(String payload) {
    final datagram = Datagram(
      Uint8List.fromList(utf8.encode(payload)),
      InternetAddress('192.168.0.120'),
      1900,
    );
    when(() => mockRawDatagramSocketAdapter.receive()).thenReturn(datagram);
    eventStreamController.add(RawSocketEvent.read);
  }

  group('ignores events other than [read]:', () {
    void ignoresEvent(RawSocketEvent event) {
      test('ignores event [$event]', () {
        eventStreamController.add(event);
        expect(sut.discover(), emitsInOrder([]));
      });
    }

    ignoresEvent(RawSocketEvent.write);
    ignoresEvent(RawSocketEvent.closed);
    ignoresEvent(RawSocketEvent.readClosed);
  });

  test('emits nothing when datagram is null', () {
    when(() => mockRawDatagramSocketAdapter.receive()).thenReturn(null);
    eventStreamController.add(RawSocketEvent.read);

    expect(sut.discover(), emitsInOrder([]));
  });

  test('emits [alive] message when receiving notify datagram', () {
    final payload = [
      'NOTIFY * HTTP/1.1',
      'Host: 239.255.255.250:1900',
      'Cache-Control: max-age=1800',
      'Location: http://192.168.0.120:49152/upnp/CameraDevDesc.xml',
      'NT: urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1',
      'NTS: ssdp:alive',
      'Server: Camera OS/1.0 UPnP/1.0 Canon Device Discovery/1.0',
      'USN: uuid:00000000-0000-0000-0001-60128B7CC240::urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1'
    ].join('\n');

    setupDatagram(payload);

    expect(
      sut.discover().timeout(const Duration(seconds: 1)),
      emitsInOrder(
        [
          const UpnpAdvertisementMessage.alive(
            serviceType:
                'urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1',
            uniqueServiceName:
                'uuid:00000000-0000-0000-0001-60128B7CC240::urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1',
            location: 'http://192.168.0.120:49152/upnp/CameraDevDesc.xml',
          )
        ],
      ),
    );
  });

  test('emits [byeBye] message when receiving notify datagram', () {
    final payload = [
      'NOTIFY * HTTP/1.1',
      'Host: 239.255.255.250:1900',
      'NT: urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1',
      'NTS: ssdp:byebye',
      'USN: uuid:00000000-0000-0000-0001-60128B7CC240::urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1',
    ].join('\n');

    setupDatagram(payload);

    expect(
      sut.discover().timeout(const Duration(seconds: 1)),
      emitsInOrder(
        [
          const UpnpAdvertisementMessage.byeBye(
            serviceType:
                'urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1',
            uniqueServiceName:
                'uuid:00000000-0000-0000-0001-60128B7CC240::urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1',
          )
        ],
      ),
    );
  });

  test('ignores notify datagram with missing NTS entry', () {
    final payload = [
      'NOTIFY * HTTP/1.1',
      'USN: uuid:00000000-0000-0000-0001-60128B7CC240::urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1'
    ].join('\n');

    final datagram = Datagram(
      Uint8List.fromList(utf8.encode(payload)),
      InternetAddress('192.168.0.120'),
      1900,
    );
    when(() => mockRawDatagramSocketAdapter.receive()).thenReturn(datagram);
    eventStreamController.add(RawSocketEvent.read);

    expect(
      sut.discover().timeout(const Duration(seconds: 1)),
      emitsInOrder([]),
    );
  });

  test('ignores notify datagram with missing NT entry', () {
    final payload = [
      'NOTIFY * HTTP/1.1',
      'NTS: ssdp:alive',
      'USN: uuid:00000000-0000-0000-0001-60128B7CC240::urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1'
    ].join('\n');

    final datagram = Datagram(
      Uint8List.fromList(utf8.encode(payload)),
      InternetAddress('192.168.0.120'),
      1900,
    );
    when(() => mockRawDatagramSocketAdapter.receive()).thenReturn(datagram);
    eventStreamController.add(RawSocketEvent.read);

    expect(
      sut.discover().timeout(const Duration(seconds: 1)),
      emitsInOrder([]),
    );
  });
}
