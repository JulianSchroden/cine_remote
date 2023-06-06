import 'package:cine_remote/camera_control/eos_ptp_ip/extensions/int_as_hex_string_extension.dart';
import 'package:equatable/equatable.dart';

class EosAutofocusPostion extends Equatable {
  final int x;
  final int y;

  const EosAutofocusPostion({required this.x, required this.y});

  @override
  List<Object?> get props => [x, y];

  @override
  String toString() {
    return 'EosAutofocusPostion(x: $x (${x.asHex(padLeft: 2)}), y: $y(${y.asHex(padLeft: 2)}))';
  }
}
