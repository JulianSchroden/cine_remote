import 'dart:typed_data';

import '../common/polled_data_stream_controller.dart';
import '../interface/camera.dart';
import '../interface/models/camera_update_response.dart';

abstract class BaseCamera extends Camera {
  PolledDataStreamController<CameraUpdateResponse>? _eventController;

  @override
  Stream<CameraUpdateResponse> events({
    Duration pollInterval = const Duration(milliseconds: 500),
  }) {
    _eventController ??=
        PolledDataStreamController<CameraUpdateResponse>(broadcast: true);

    return _eventController!.pollData(
      pollInterval: pollInterval,
      pollData: () => getUpdate(),
    );
  }

  Future<CameraUpdateResponse> getUpdate();

  @override
  Stream<Uint8List> liveView({
    Duration pollInterval = const Duration(milliseconds: 200),
  }) {
    final controller = PolledDataStreamController<Uint8List>();

    return controller.pollData(
      pollInterval: pollInterval,
      onListen: () => startLiveView(),
      pollData: () => getLiveViewImage(),
      onCancel: () => stopLiveView(),
    );
  }

  Future<void> startLiveView();
  Future<void> stopLiveView();
  Future<Uint8List> getLiveViewImage();
}
