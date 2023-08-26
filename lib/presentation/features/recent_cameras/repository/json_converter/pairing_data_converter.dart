import 'dart:typed_data';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:json_annotation/json_annotation.dart';

import 'json_converter_exception.dart';

class PairingDataConverter
    implements JsonConverter<PairingData, Map<String, dynamic>> {
  const PairingDataConverter();

  @override
  PairingData fromJson(Map<String, dynamic> json) {
    switch (json['pairingDataType']) {
      case 'demo':
        {
          return const DemoCameraPairingData();
        }
      case 'eosCineHttp':
        {
          return EosCineHttpCameraPairingData(address: json['address']);
        }
      case 'eosPtpIp':
        {
          return EosPtpIpCameraPairingData(
            guid: Uint8List.fromList(List<int>.from(json['guid'])),
            address: json['address'],
            clientName: json['clientName'],
          );
        }
    }

    throw JsonConverterException();
  }

  @override
  Map<String, dynamic> toJson(PairingData pairingData) {
    switch (pairingData.runtimeType) {
      case DemoCameraPairingData:
        {
          return {
            'pairingDataType': 'demo',
          };
        }
      case EosCineHttpCameraPairingData:
        {
          final eosCinePairingData =
              pairingData as EosCineHttpCameraPairingData;
          return {
            'pairingDataType': 'eosCineHttp',
            'address': eosCinePairingData.address,
          };
        }
      case EosPtpIpCameraPairingData:
        {
          final eosPtpIpPairingData = pairingData as EosPtpIpCameraPairingData;
          return {
            'pairingDataType': 'eosPtpIp',
            'guid': eosPtpIpPairingData.guid.toList(),
            'address': eosPtpIpPairingData.address,
            'clientName': eosPtpIpPairingData.clientName,
          };
        }
    }

    return {};
  }
}
