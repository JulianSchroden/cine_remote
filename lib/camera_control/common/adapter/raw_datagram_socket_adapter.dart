import 'dart:io';

class RawDatagramSocketAdapter {
  final RawDatagramSocket socket;
  const RawDatagramSocketAdapter(this.socket);

  Stream<RawSocketEvent> get stream => socket;

  Datagram? receive() => socket.receive();

  void close() => socket.close();

  void joinMulticast(InternetAddress group) => socket.joinMulticast(group);
}

class RawDatagramSocketFactory {
  const RawDatagramSocketFactory();

  Future<RawDatagramSocketAdapter> bind(dynamic host, int port) async =>
      RawDatagramSocketAdapter(await RawDatagramSocket.bind(host, port));
}
