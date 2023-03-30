import 'dart:typed_data';

import '../common/polled_data_stream_controller.dart';
import '../interface/camera.dart';

abstract class BaseCamera extends Camera {
  const BaseCamera();

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
