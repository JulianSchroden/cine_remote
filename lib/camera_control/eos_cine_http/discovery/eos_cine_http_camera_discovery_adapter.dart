import '../../common/discovery/wifi_info_adapter.dart';
import '../../interface/camera_factory.dart';
import '../../interface/discovery/camera_discovery_adapter.dart';
import '../../interface/discovery/discovery_handle.dart';
import '../constants/eos_cine_ip_config.dart';
import '../models/eos_cine_http_discovery_handle.dart';

class EosCineHttpCameraDiscoveryAdapter extends CameraDiscoveryAdapter {
  final WifiInfoAdapter wifiInfoAdapter;
  final Duration interval;

  EosCineHttpCameraDiscoveryAdapter(
    this.wifiInfoAdapter, [
    this.interval = const Duration(seconds: 5),
  ]);

  @override
  Stream<DiscoveryHandle> discover() {
    return Stream.periodic(interval, (_) async {
      final localIp = await wifiInfoAdapter.getLocalIp();
      final gatewayIp = await wifiInfoAdapter.getGatewayIp();

      if (localIp == EosCineIpConfig.localIp &&
          gatewayIp == EosCineIpConfig.gatewayIp) {
        return const EosCineHttpDiscoveryHandle(CameraModels.canonC100II);
      }
    })
        .asyncMap((future) => future)
        .where((camera) => camera != null)
        .cast<DiscoveryHandle>();
  }
}
