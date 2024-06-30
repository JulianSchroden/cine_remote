import 'dart:typed_data';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:json_annotation/json_annotation.dart';

import 'json_converter_exception.dart';

class PairingDataConverter
    implements JsonConverter<PairingData, Map<String, dynamic>> {
  const PairingDataConverter();

  @override
  PairingData fromJson(Map<String, dynamic> json) => switch (json) {
        {'pairingDataType': 'demo'} => const DemoCameraPairingData(),
        {
          'pairingDataType': 'eosCineHttp',
          'address': String address,
        } =>
          EosCineHttpCameraPairingData(address: address),
        {
          'pairingDataType': 'eosPtpIp',
          'guid': List<int> guid,
          'address': String address,
          'clientName': String clientName
        } =>
          EosPtpIpCameraPairingData(
            guid: Uint8List.fromList(guid),
            address: address,
            clientName: clientName,
          ),
        _ => throw JsonConverterException()
      };

  @override
  Map<String, dynamic> toJson(PairingData pairingData) => switch (pairingData) {
        DemoCameraPairingData() => {
            'pairingDataType': 'demo',
          },
        EosCineHttpCameraPairingData(:final address) => {
            'pairingDataType': 'eosCineHttp',
            'address': address,
          },
        EosPtpIpCameraPairingData(
          :final guid,
          :final address,
          :final clientName
        ) =>
          {
            'pairingDataType': 'eosPtpIp',
            'guid': guid.toList(),
            'address': address,
            'clientName': clientName,
          },
        _ => {}
      };
}
