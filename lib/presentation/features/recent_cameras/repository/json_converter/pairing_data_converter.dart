import 'package:json_annotation/json_annotation.dart';

import '../../../../../camera_control/demo/demo_camera_pairing_data.dart';
import '../../../../../camera_control/eos_cine_http/eos_cine_http_camera_pairing_data.dart';
import '../../../../../camera_control/eos_ptp_ip/eos_ptp_ip_camera_pairing_data.dart';
import '../../../../../camera_control/interface/models/pairing_data.dart';
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
            guid: json['guid'],
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
            'guid': eosPtpIpPairingData.guid,
            'address': eosPtpIpPairingData.address,
            'clientName': eosPtpIpPairingData.clientName,
          };
        }
    }

    return {};
  }
}
