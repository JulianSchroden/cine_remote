import '../../common/discovery/upnp/upnp_device_description.dart';
import '../../common/discovery/upnp/upnp_discovery_adapter.dart';
import '../../interface/camera_factory.dart';
import '../../interface/discovery/camera_discovery_adapter.dart';
import '../../interface/discovery/discovery_handle.dart';
import 'eos_ptp_ip_discovery_handle.dart';

class EosPtpIpCameraDiscoveryAdapter extends CameraDiscoveryAdapter {
  static const eosPtpIpService =
      'urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1';
  final UpnpDiscoveryAdapter upnpDiscoveryAdapter;

  EosPtpIpCameraDiscoveryAdapter(this.upnpDiscoveryAdapter);

  @override
  Stream<DiscoveryHandle> discover() async* {
    await for (final deviceDescription in onCameraAlive) {
      final model = CameraModels.findByName(deviceDescription.modelName);
      if (model == null) {
        continue;
      }

      yield EosPtpIpDiscoveryHandle(
        address: deviceDescription.address,
        id: deviceDescription.uniqueDeviceName,
        model: model,
      );
    }
  }

  Stream<UpnpDeviceDescription> get onCameraAlive =>
      upnpDiscoveryAdapter.onDeviceAlive(eosPtpIpService);
}
