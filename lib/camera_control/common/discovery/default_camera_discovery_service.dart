import 'wifi_info_adapter.dart';
import '../../interface/discovery/camera_discovery_service.dart';
import '../../interface/discovery/wifi_info.dart';

class DefaultCameraDiscoveryService implements CameraDiscoveryService {
  final WifiInfoAdapter wifiInfoAdapter;

  DefaultCameraDiscoveryService({WifiInfoAdapter? wifiInfoAdapter})
      : wifiInfoAdapter = wifiInfoAdapter ?? WifiInfoAdapter();

  @override
  Future<WifiInfo> wifiInfo() async {
    final localIp = await wifiInfoAdapter.getLocalIp();
    final gatewayIp = await wifiInfoAdapter.getGatewayIp();

    return WifiInfo(localIp, gatewayIp);
  }
}
