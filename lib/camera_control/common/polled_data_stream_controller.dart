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
      try {
        await onListen?.call();
      } catch (e, s) {
        _controller?.addError(e, s);
        _controller?.close();
        return;
      }

      _timer = Timer.periodic(pollInterval, (timer) async {
        if (!(_pollDataCompleter?.isCompleted ?? true)) {
          return;
        }

        _pollDataCompleter = Completer<void>();

        pollData(_controller!.sink).then((_) {
          _pollDataCompleter?.complete();
        }, onError: (e, s) {
          _controller!.sink.addError(e, s);
        });
      });
    };
    _controller!.onCancel = () async {
      _timer?.cancel();

      try {
        await onCancel?.call();
      } catch (e, s) {
        _controller!.sink.addError(e, s);
      }
    };

    return _controller!.stream;
  }
}
