import '../common/base_camera.dart';
import '../common/polled_data_stream_controller.dart';
import '../interface/models/camera_descriptor.dart';
import '../interface/models/camera_update_event.dart';
import '../interface/models/camera_update_response.dart';
import '../interface/models/capabilities/control_prop_capability.dart';
import '../interface/models/capabilities/live_view_capability.dart';
import '../interface/models/capabilities/movie_record_capability.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import '../interface/models/control_prop_value.dart';
import '../interface/models/live_view_data.dart';
import '../interface/models/properties/autofocus_position.dart';
import '../interface/models/properties/camera_mode.dart';
import '../interface/models/properties/exposure_mode.dart';
import 'adapter/http_adapter.dart';
import 'communication/action_factory.dart';
import 'models/camera_info.dart';
import 'models/eos_cine_prop_value.dart';

class EosCineHttpCamera extends BaseCamera {
  final HttpAdapter httpAdapter;
  final ActionFactory actionFactory;
  PolledDataStreamController<CameraUpdateEvent>? _eventController;
  int _nextUpdateSequence = 0;

  EosCineHttpCamera(
    this.httpAdapter, [
    this.actionFactory = const ActionFactory(),
  ]);

  @override
  Future<void> close() async {
    await httpAdapter.close();
  }

  @override
  Future<void> disconnect() async {
    await close();
  }

  @override
  Future<CameraDescriptor> getDescriptor() async {
    return const CameraDescriptor(
      mode: CameraMode.video(ExposureMode.manual),
      capabilities: [
        ControlPropCapability(supportedProps: [
          ControlPropType.aperture,
          ControlPropType.iso,
          ControlPropType.shutterAngle,
          ControlPropType.whiteBalance,
        ]),
        LiveViewCapability(
          aspectRatio: 16 / 9,
          supportsTouchAutofocus: false,
        ),
        MovieRecordCapility(),
      ],
    );
  }

  @override
  Future<ControlProp?> getProp(
    ControlPropType propType,
  ) {
    final getPropAction =
        actionFactory.createGetPropAction(httpAdapter, propType);
    return getPropAction();
  }

  @override
  Future<void> setProp(
    ControlPropType propType,
    ControlPropValue propValue,
  ) async {
    final setPropAction = actionFactory.createSetPropAction(
      httpAdapter,
      propType,
      propValue as EosCinePropValue,
    );
    await setPropAction();
  }

  @override
  Future<void> captureImage() async {}

  @override
  Future<void> triggerRecord() async {
    final triggerRecordAction =
        actionFactory.createTriggerRecordAction(httpAdapter);
    await triggerRecordAction();
  }

  @override
  Future<void> toggleAfLock() async {
    final toggleAfLockAction =
        actionFactory.createToggleAfLockAction(httpAdapter);
    await toggleAfLockAction();
  }

  @override
  Stream<CameraUpdateEvent> events() {
    _eventController ??= PolledDataStreamController<CameraUpdateEvent>(
      pollInterval: const Duration(milliseconds: 500),
      pollData: (sink) async {
        final response = await getUpdate();
        sink.addStream(Stream.fromIterable(response.cameraEvents));
      },
      broadcast: true,
    );

    return _eventController!.stream;
  }

  Future<CameraUpdateResponse> getUpdate() async {
    final getUpdateAction =
        actionFactory.createGetUpdateAction(httpAdapter, _nextUpdateSequence);
    final response = await getUpdateAction();

    _nextUpdateSequence = response.updateSequnce;
    return CameraUpdateResponse(cameraEvents: response.cameraEvents);
  }

  @override
  Future<void> startLiveView() async {
    final startLiveViewAction =
        actionFactory.createStartLiveViewAction(httpAdapter);
    await startLiveViewAction();
  }

  @override
  Future<void> stopLiveView() async {
    final stopLiveViewAction =
        actionFactory.createStopLiveViewAction(httpAdapter);
    await stopLiveViewAction();
  }

  @override
  Future<LiveViewData> getLiveViewData() async {
    final getLiveViewImageAction =
        actionFactory.createGetLiveViewImageAction(httpAdapter);
    return getLiveViewImageAction();
  }

  Future<CameraInfo> getInfo() async {
    final getInfoAction = actionFactory.createGetInfoAction(httpAdapter);
    return getInfoAction();
  }

  @override
  Future<void> setAutofocusPosition(
      AutofocusPosition autofocusPosition) async {}
}
