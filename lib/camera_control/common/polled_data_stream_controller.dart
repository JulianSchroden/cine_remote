import 'dart:async';

class PolledDataStreamController<T> {
  Stream<T> pollData({
    required Duration pollInterval,
    required Future<T> Function() pollData,
    FutureOr<void> Function()? onListen,
    FutureOr<void> Function()? onCancel,
  }) {
    Timer? timer;
    Completer<void>? pollDataCompleter;

    final controller = StreamController<T>();

    controller.onListen = () async {
      await onListen?.call();

      timer = Timer.periodic(pollInterval, (timer) async {
        if (!(pollDataCompleter?.isCompleted ?? true)) {
          return;
        }

        pollDataCompleter = Completer<void>();

        pollData().then((event) {
          pollDataCompleter?.complete();
          controller.add(event);
        });
      });
    };
    controller.onCancel = () async {
      timer?.cancel();
      await onCancel?.call();
    };

    return controller.stream;
  }
}
