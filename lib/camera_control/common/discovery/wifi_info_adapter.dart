import 'package:network_info_plus/network_info_plus.dart' as nip;

class WifiInfoAdapter {
  final nip.NetworkInfo networkInfo = nip.NetworkInfo();

  Future<String?> getLocalIp() => networkInfo.getWifiIP();

  Future<String?> getGatewayIp() => networkInfo.getWifiGatewayIP();
}
