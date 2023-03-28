import 'dart:typed_data';

extension DumpHexDataExtension on Uint8List {
  String dumpAsHex() {
    final hexValues =
        map((value) => value.toRadixString(16).padLeft(2, '0')).toList();

    final buffer = StringBuffer('\n');

    var counter = 1;
    for (var value in hexValues) {
      buffer.write(value);

      if (counter % 16 == 0) {
        buffer.writeln();
      } else if (counter % 8 == 0) {
        buffer.write('  ');
      } else {
        buffer.write(' ');
      }

      counter++;
    }

    return buffer.toString();
  }
}
