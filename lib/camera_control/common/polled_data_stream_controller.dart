import 'dart:async';

class PolledDataStreamController<T> {
  final Duration pollInterval;
  final bool broadcast;

  Future<void> Function(StreamSink<T>) pollData;
  FutureOr<void> Function()? onListen;
  FutureOr<void> Function()? onCancel;

  PolledDataStreamController({
    required this.pollInterval,
    required this.pollData,
    this.onListen,
    this.onCancel,
    this.broadcast = false,
  });

  StreamController<T>? _controller;
  Timer? _timer;
  Completer<void>? _pollDataCompleter;

  Stream<T> get stream {
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

        pollData(_controller!.sink).then((_) {
          _pollDataCompleter?.complete();
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
