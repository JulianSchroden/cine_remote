import 'dart:typed_data';

import '../interface/models/pairing_data.dart';

class EosPtpIpCameraPairingData extends PairingData {
  final Uint8List guid;
  final String address;
  final String clientName;

  const EosPtpIpCameraPairingData({
    required this.guid,
    required this.address,
    required this.clientName,
  });

  @override
  List<Object?> get props => [
        guid,
        address,
        clientName,
      ];
}
