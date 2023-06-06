import 'dart:typed_data';

import '../common/polled_data_stream_controller.dart';
import '../interface/camera.dart';

abstract class BaseCamera extends Camera {
  const BaseCamera();

  @override
  Stream<Uint8List> liveView({
    Duration pollInterval = const Duration(milliseconds: 1000),
  }) {
    final controller = PolledDataStreamController<Uint8List>(
      pollInterval: pollInterval,
      onListen: () => startLiveView(),
      pollData: (sink) async {
        try {
          final imageBytes = await getLiveViewImage();
          sink.add(imageBytes);
        } catch (e, s) {
          sink.addError(e, s);
        }
      },
      onCancel: () => stopLiveView(),
    );

    return controller.stream;
  }

  Future<void> startLiveView();
  Future<void> stopLiveView();
  Future<Uint8List> getLiveViewImage();
}
