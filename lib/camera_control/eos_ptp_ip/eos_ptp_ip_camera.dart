import 'dart:async';
import 'dart:typed_data';

import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/live_view_data_parser.dart';

import '../common/base_camera.dart';
import '../interface/models/camera_descriptor.dart';
import '../interface/models/camera_update_event.dart';
import '../interface/models/capabilities/control_prop_capability.dart';
import '../interface/models/capabilities/image_capture_capability.dart';
import '../interface/models/capabilities/live_view_capability.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import '../interface/models/control_prop_value.dart';
import '../interface/models/properties/autofocus_position.dart';
import '../interface/models/properties/camera_mode.dart';
import '../interface/models/properties/exposure_mode.dart';
import 'actions/action_factory.dart';
import 'adapter/eos_ptp_event_processor.dart';
import 'communication/ptp_transaction_queue.dart';
import 'constants/properties/live_view_output.dart';
import 'models/eos_ptp_prop_value.dart';
import 'models/eos_sensor_info.dart';

class EosPtpIpCamera extends BaseCamera {
  final PtpTransactionQueue _transactionQueue;
  final ActionFactory _actionFactory;
  final EosPtpEventProcessor _eventProcessor;
  final LiveViewDataParser _liveViewDataParser;

  const EosPtpIpCamera(
    this._transactionQueue,
    this._actionFactory,
    this._eventProcessor,
    this._liveViewDataParser,
  );

  @override
  Future<void> close() async {
    await _transactionQueue.close();
  }

  @override
  Future<void> disconnect() async {
    final deinitSession = _actionFactory.createDeinitSessionAction();
    await deinitSession.run(_transactionQueue);
    await close();
  }

  @override
  Future<CameraDescriptor> getDescriptor() async {
    return CameraDescriptor(
      mode: const CameraMode.photo(ExposureMode.manual),
      capabilities: [
        ControlPropCapability(
          supportedProps: _eventProcessor.propertyCache.supportedProps(),
        ),
        const LiveViewCapability(
          aspectRatio: 3 / 2,
          supportsTouchAutofocus: true,
        ),
        const ImageCaptureCapability(),
      ],
    );
  }

  @override
  Future<ControlProp?> getProp(ControlPropType propType) async {
    return _eventProcessor.propertyCache.getProp(propType);
  }

  @override
  Future<void> setProp(
    ControlPropType propType,
    ControlPropValue propValue,
  ) async {
    final setPropAction = _actionFactory.createSetPropAction(
      propType,
      propValue as EosPtpPropValue,
    );
    await setPropAction.run(_transactionQueue);
  }

  @override
  Stream<CameraUpdateEvent> events() => _eventProcessor.events;

  @override
  Future<void> captureImage() async {
    final captureImage = _actionFactory.createCaptureImageAction();
    await captureImage.run(_transactionQueue);
  }

  @override
  Future<void> triggerRecord() async {}

  @override
  Future<void> toggleAfLock() async {}

  @override
  Future<void> startLiveView() async {
    final startLiveView = _actionFactory.createSetLiveViewOutputAction(
      _eventProcessor,
      LiveViewOutput.cameraAndHost,
    );
    await startLiveView.run(_transactionQueue);
  }

  @override
  Future<void> stopLiveView() async {
    final stopLiveView = _actionFactory.createSetLiveViewOutputAction(
      _eventProcessor,
      LiveViewOutput.none,
    );
    await stopLiveView.run(_transactionQueue);
  }

  @override
  Future<Uint8List> getLiveViewImage() async {
    final getLiveViewImage =
        _actionFactory.createGetLiveViewImageAction(_liveViewDataParser);
    return await getLiveViewImage.run(_transactionQueue);
  }

  @override
  Future<void> setAutofocusPosition(AutofocusPosition autofocusPosition) async {
    const sensorInfo = EosSensorInfo(
        width: 5472, height: 3648); // TODO: get values dynamically
    final setAutofocusPosition = _actionFactory.createSetTouchAfPositionAction(
      autofocusPosition,
      sensorInfo,
    );
    await setAutofocusPosition.run(_transactionQueue);
  }
}
