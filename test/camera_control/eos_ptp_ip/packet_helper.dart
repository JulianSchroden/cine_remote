import 'dart:typed_data';

Uint8List preparePacket(List<List<int>> structuredBytes) =>
    Uint8List.fromList(structuredBytes.expand((byte) => byte).toList());
