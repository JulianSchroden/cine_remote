import 'dart:async';

class PolledDataStreamController<T> {
  final bool broadcast;

  PolledDataStreamController({this.broadcast = false});

  StreamController<T>? _controller;
  Timer? _timer;
  Completer<void>? _pollDataCompleter;

  Stream<T> pollData({
    required Duration pollInterval,
    required Future<T> Function() pollData,
    FutureOr<void> Function()? onListen,
    FutureOr<void> Function()? onCancel,
  }) {
    if (_controller != null) {
      return _controller!.stream;
    }

    _controller ??=
        broadcast ? StreamController<T>.broadcast() : StreamController<T>();
    _controller!.onListen = () async {
      await onListen?.call();

      _timer = Timer.periodic(pollInterval, (timer) async {
        if (!(_pollDataCompleter?.isCompleted ?? true)) {
          return;
        }

        _pollDataCompleter = Completer<void>();

        pollData().then((event) {
          _pollDataCompleter?.complete();
          _controller?.add(event);
        });
      });
    };
    _controller!.onCancel = () async {
      _timer?.cancel();
      await onCancel?.call();
    };

    return _controller!.stream;
  }
}
