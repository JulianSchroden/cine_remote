import '../../common/discovery/wifi_info_adapter.dart';
import '../../interface/camera_factory.dart';
import '../../interface/discovery/camera_discovery_adapter.dart';
import '../../interface/discovery/camera_discovery_event.dart';
import '../constants/eos_cine_ip_config.dart';
import '../models/eos_cine_http_discovery_handle.dart';

class EosCineHttpCameraDiscoveryAdapter extends CameraDiscoveryAdapter {
  static const eosC100IIId = 'canon_c100_ii_1';
  final WifiInfoAdapter wifiInfoAdapter;
  final Duration interval;

  EosCineHttpCameraDiscoveryAdapter(
    this.wifiInfoAdapter, [
    this.interval = const Duration(seconds: 5),
  ]);

  @override
  Stream<CameraDiscoveryEvent> discover() {
    return Stream.periodic(interval, (_) async {
      final localIp = await wifiInfoAdapter.getLocalIp();
      final gatewayIp = await wifiInfoAdapter.getGatewayIp();

      if (localIp == EosCineIpConfig.localIp &&
          gatewayIp == EosCineIpConfig.gatewayIp) {
        return const CameraDiscoveryEvent.alive(
          handle: EosCineHttpDiscoveryHandle(
            id: eosC100IIId,
            model: CameraModels.canonC100II,
          ),
        );
      }

      return const CameraDiscoveryEvent.byeBye(
        id: eosC100IIId,
      );
    }).asyncMap((future) => future);
  }
}
