import 'package:equatable/equatable.dart';

class WifiInfo extends Equatable {
  final String? localIp;
  final String? gatewayIp;

  const WifiInfo(this.localIp, this.gatewayIp);

  @override
  List<Object?> get props => [localIp, gatewayIp];
}
