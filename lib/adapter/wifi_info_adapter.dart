import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:network_info_plus/network_info_plus.dart' as nip;

class WifiInfoAdapterImpl extends WifiInfoAdapter {
  final nip.NetworkInfo networkInfo = nip.NetworkInfo();

  @override
  Future<String?> getLocalIp() => networkInfo.getWifiIP();

  @override
  Future<String?> getGatewayIp() => networkInfo.getWifiGatewayIP();
}
