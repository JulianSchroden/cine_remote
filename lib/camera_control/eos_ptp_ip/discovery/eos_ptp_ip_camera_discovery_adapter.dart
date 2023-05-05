import '../../common/discovery/upnp/upnp_advertisement_message.dart';
import '../../common/discovery/upnp/upnp_discovery_adapter.dart';
import '../../interface/camera_factory.dart';
import '../../interface/discovery/camera_discovery_adapter.dart';
import '../../interface/discovery/camera_discovery_event.dart';
import 'eos_ptp_ip_discovery_handle.dart';

class EosPtpIpCameraDiscoveryAdapter extends CameraDiscoveryAdapter {
  static const eosPtpIpService =
      'urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1';
  final UpnpDiscoveryAdapter upnpDiscoveryAdapter;

  EosPtpIpCameraDiscoveryAdapter(this.upnpDiscoveryAdapter);

  @override
  Stream<CameraDiscoveryEvent> discover() async* {
    await for (final upnpMessage in upnpDiscoveryAdapter.discover()) {
      if (upnpMessage is UpnpAdvertisementAlive) {
        if (upnpMessage.serviceType != eosPtpIpService) {
          continue;
        }

        final deviceDescription = await upnpDiscoveryAdapter
            .getDeviceDescription(upnpMessage.location);
        if (deviceDescription == null) {
          continue;
        }

        final model = CameraModels.findByName(deviceDescription.modelName);
        if (model == null) {
          continue;
        }

        yield CameraDiscoveryEvent.alive(
          handle: EosPtpIpDiscoveryHandle(
            address: deviceDescription.address,
            id: deviceDescription.uniqueDeviceName,
            model: model,
          ),
        );
      } else if (upnpMessage is UpnpAdvertisementByeBye) {
        yield CameraDiscoveryEvent.byeBye(
          id: upnpMessage.uniqueDeviceName,
        );
      }
    }
  }
}
