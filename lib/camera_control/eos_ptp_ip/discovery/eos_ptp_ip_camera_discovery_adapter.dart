import '../../common/discovery/upnp/upnp_advertisement_message.dart';
import '../../common/discovery/upnp/upnp_discovery_adapter.dart';
import '../../interface/camera_factory.dart';
import '../../interface/discovery/camera_discovery_adapter.dart';
import '../../interface/discovery/camera_discovery_event.dart';
import '../logging/eos_ptp_ip_logger.dart';
import 'eos_ptp_ip_discovery_handle.dart';

class EosPtpIpCameraDiscoveryAdapter extends CameraDiscoveryAdapter {
  static const eosPtpIpService =
      'urn:schemas-canon-com:service:ICPO-WFTEOSSystemService:1';
  final UpnpDiscoveryAdapter upnpDiscoveryAdapter;

  final logger = EosPtpIpLogger();

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

        logger.logCameraAlive(deviceDescription.uniqueDeviceName);

        yield CameraDiscoveryEvent.alive(
          handle: EosPtpIpDiscoveryHandle(
            address: deviceDescription.address,
            id: deviceDescription.uniqueDeviceName,
            model: model,
          ),
        );
      } else if (upnpMessage is UpnpAdvertisementByeBye) {
        if (upnpMessage.serviceType != eosPtpIpService) {
          continue;
        }

        logger.logCameraByeBye(upnpMessage.uniqueDeviceName);

        yield CameraDiscoveryEvent.byeBye(
          id: upnpMessage.uniqueDeviceName,
        );
      }
    }
  }
}
