import 'dart:io';

class SocketFactory {
  Future<Socket> connect({
    required InternetAddress address,
    required int port,
    Duration timeout = const Duration(seconds: 10),
  }) =>
      Socket.connect(address, port, timeout: timeout);
}
