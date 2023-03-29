import 'dart:typed_data';

import '../../common/list_extensions.dart';
import 'int_as_hex_string_extension.dart';

extension DumpHexDataExtension on Uint8List {
  String dumpAsHex({bool asValidList = false}) {
    final hexValues =
        map((value) => value.asHex(withPrefix: asValidList, padLeft: 2))
            .toList();

    final buffer = StringBuffer('\n[\n   ');

    var counter = 1;
    for (var value in hexValues) {
      buffer.write(value);
      if (asValidList) {
        buffer.write(',');
      }

      if (counter % 16 == 0) {
        if (counter != hexValues.lastIndex) {
          buffer.write('\n   ');
        }
      } else if (counter % 8 == 0) {
        buffer.write('  ');
      } else {
        buffer.write(' ');
      }

      counter++;
    }

    buffer.write('\n]');

    return buffer.toString();
  }
}
