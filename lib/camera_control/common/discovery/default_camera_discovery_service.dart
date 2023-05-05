import 'package:rxdart/rxdart.dart';

import '../../eos_cine_http/discovery/eos_cine_http_camera_discovery_adapter.dart';
import '../../eos_ptp_ip/discovery/eos_ptp_ip_camera_discovery_adapter.dart';
import '../../interface/discovery/camera_discovery_event.dart';
import '../../interface/discovery/camera_discovery_service.dart';
import '../../interface/discovery/wifi_info.dart';
import 'upnp/upnp_discovery_adapter.dart';
import 'wifi_info_adapter.dart';

class DefaultCameraDiscoveryService implements CameraDiscoveryService {
  final WifiInfoAdapter wifiInfoAdapter;
  final UpnpDiscoveryAdapter upnpDiscoveryAdapter;

  DefaultCameraDiscoveryService({
    WifiInfoAdapter? wifiInfoAdapter,
    UpnpDiscoveryAdapter? upnpDiscoveryAdapter,
  })  : wifiInfoAdapter = wifiInfoAdapter ?? WifiInfoAdapter(),
        upnpDiscoveryAdapter = upnpDiscoveryAdapter ?? UpnpDiscoveryAdapter();

  @override
  Future<WifiInfo> wifiInfo() async {
    final localIp = await wifiInfoAdapter.getLocalIp();
    final gatewayIp = await wifiInfoAdapter.getGatewayIp();

    return WifiInfo(localIp, gatewayIp);
  }

  @override
  Stream<CameraDiscoveryEvent> discover() {
    return MergeStream([
      EosPtpIpCameraDiscoveryAdapter(upnpDiscoveryAdapter).discover(),
      EosCineHttpCameraDiscoveryAdapter(wifiInfoAdapter).discover(),
    ]);
  }
}
