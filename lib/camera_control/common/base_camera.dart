import 'dart:typed_data';

import '../common/polled_data_stream_controller.dart';
import '../interface/camera.dart';

abstract class BaseCamera extends Camera {
  @override
  Stream<Uint8List> liveView({
    Duration pollInterval = const Duration(milliseconds: 200),
  }) {
    final controller = PolledDataStreamController<Uint8List>(
      pollInterval: pollInterval,
      onListen: () => startLiveView(),
      pollData: (sink) => sink.addStream(Stream.fromFuture(getLiveViewImage())),
      onCancel: () => stopLiveView(),
    );

    return controller.stream;
  }

  Future<void> startLiveView();
  Future<void> stopLiveView();
  Future<Uint8List> getLiveViewImage();
}
