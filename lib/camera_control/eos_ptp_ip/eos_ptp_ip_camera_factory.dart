import 'package:logging/logging.dart';

import '../interface/camera.dart';
import '../interface/camera_factory.dart';
import 'adapter/ptp_request_factory.dart';
import 'communication/ptp_ip_channel.dart';
import 'communication/ptp_ip_client.dart';
import 'eos_ptp_ip_camera.dart';
import 'eos_ptp_ip_camera_descriptor.dart';
import 'extensions/stream_extensions.dart';
import 'responses/ptp_init_command_response.dart';
import 'responses/ptp_init_event_response.dart';

class EosPtpIpCameraFactory extends CameraFactory<EosPtpIpCameraDescriptor> {
  static const ptpIpPort = 15740;
  final Logger logger = Logger('EosPtpIpCameraFactory');

  @override
  Future<Camera> connect(EosPtpIpCameraDescriptor descriptor) async {
    logger.info('Attempting to open command channel');
    final commandChannel =
        await PtpIpChannel.connect(descriptor.address, ptpIpPort);

    logger.info('Sending initCommand request');
    await commandChannel.write(PtpRequestFactory().createInitCommandRequest(
        name: descriptor.clientName, guid: descriptor.guid));

    final initCommandResponse = await commandChannel.onResponse
        .firstWhereType<PtpInitCommandResponse>()
        .timeout(const Duration(seconds: 10));

    logger.info(
        'Received initCommand response with connectionNumber: ${initCommandResponse.connectionNumber}');

    logger.info('Attempting to open event channel');
    final eventChannel =
        await PtpIpChannel.connect(descriptor.address, ptpIpPort);

    logger.info("Sending initEvent request");
    await eventChannel.write(PtpRequestFactory().createInitEventRequest(
        connectionNumber: initCommandResponse.connectionNumber));

    await eventChannel.onResponse
        .firstWhereType<PtpInitEventResponse>()
        .timeout(const Duration(seconds: 10));

    logger.info('Received initEvent response');

    final client = PtpIpClient(commandChannel, eventChannel);
    return EosPtpIpCamera(client);
  }
}
