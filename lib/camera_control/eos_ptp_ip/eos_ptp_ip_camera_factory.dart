import '../common/extensions/stream_extensions.dart';
import '../interface/camera.dart';
import '../interface/camera_factory.dart';
import '../interface/models/camera_handle.dart';
import 'actions/action_factory.dart';
import 'adapter/eos_ptp_event_processor.dart';
import 'adapter/get_eos_events_delegate.dart';
import 'adapter/ptp_request_factory.dart';
import 'cache/ptp_property_cache.dart';
import 'communication/ptp_ip_channel.dart';
import 'communication/ptp_ip_client.dart';
import 'communication/ptp_transaction_queue.dart';
import 'eos_ptp_ip_camera.dart';
import 'eos_ptp_ip_camera_pairing_data.dart';
import 'logging/eos_ptp_ip_logger.dart';
import 'responses/ptp_init_command_response.dart';
import 'responses/ptp_init_event_response.dart';

class EosPtpIpCameraFactory extends CameraFactory<EosPtpIpCameraPairingData> {
  static const ptpIpPort = 15740;

  final ActionFactory _actionFactory;
  final EosPtpIpLogger logger = EosPtpIpLogger();

  EosPtpIpCameraFactory([
    this._actionFactory = const ActionFactory(),
  ]);

  @override
  Future<void> pair(CameraHandle handle) async {
    final client = await _initClient(
      handle,
      initCommandTimeout: const Duration(minutes: 3),
    );
    await client.disconnect();
  }

  @override
  Future<Camera> connect(CameraHandle handle) async {
    final client = await _initClient(
      handle,
      initCommandTimeout: const Duration(seconds: 10),
    );
    final transactionQueue = PtpTransactionQueue(client);

    final initSession = _actionFactory.createInitSessionAction();
    await initSession.run(transactionQueue);

    logger.info('Requesting initial event data');
    final getEventData = _actionFactory.createGetEventsAction();
    final updateEvents = await getEventData.run(transactionQueue);

    logger.info('Init property cache with event data');
    final propertyCache = PtpPropertyCache();
    propertyCache.update(updateEvents);

    final eventProcessor = EosPtpEventProcessor(
      GetEosEventsDelegate(
        transactionQueue,
        _actionFactory,
      ),
      propertyCache,
    );

    logger.info('Initialization finished');
    return EosPtpIpCamera(
      transactionQueue,
      _actionFactory,
      eventProcessor,
    );
  }

  Future<PtpIpClient> _initClient(
    CameraHandle handle, {
    Duration? initCommandTimeout,
  }) async {
    final pairingData = handle.pairingData as EosPtpIpCameraPairingData;

    logger.info('Attempting to open command channel');
    final commandChannel =
        await PtpIpChannel.connect(pairingData.address, ptpIpPort);

    logger.info('Sending initCommand request');
    final initCommandResponse = await _initCommandChannel(
      commandChannel,
      pairingData,
      timeout: initCommandTimeout,
    );
    logger.info(
        'Received initCommand response with connectionNumber: ${initCommandResponse.connectionNumber}');

    logger.info('Attempting to open event channel');
    final eventChannel =
        await PtpIpChannel.connect(pairingData.address, ptpIpPort);

    logger.info("Sending initEvent request");
    await _initEventChannel(eventChannel, initCommandResponse.connectionNumber);
    logger.info('Received initEvent response');

    return PtpIpClient(commandChannel, eventChannel);
  }

  Future<PtpInitCommandResponse> _initCommandChannel(
    PtpIpChannel commandChannel,
    EosPtpIpCameraPairingData pairingData, {
    Duration? timeout,
  }) async {
    await commandChannel.write(PtpRequestFactory().createInitCommandRequest(
        name: pairingData.clientName, guid: pairingData.guid));

    final initCommandFuture =
        commandChannel.onResponse.firstWhereType<PtpInitCommandResponse>();

    final initCommandResponse = timeout != null
        ? await initCommandFuture.timeout(timeout)
        : await initCommandFuture;

    return initCommandResponse;
  }

  Future<PtpInitEventResponse> _initEventChannel(
    PtpIpChannel eventChannel,
    int connectionNumber,
  ) async {
    await eventChannel.write(PtpRequestFactory()
        .createInitEventRequest(connectionNumber: connectionNumber));

    final initEventResponse = await eventChannel.onResponse
        .firstWhereType<PtpInitEventResponse>()
        .timeout(const Duration(seconds: 10));

    return initEventResponse;
  }
}
