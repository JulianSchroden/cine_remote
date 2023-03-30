import 'dart:typed_data';

import 'int_as_hex_string_extension.dart';

extension DumpHexDataExtension on Uint8List {
  String dumpAsHex({
    bool asValidList = false,
    bool withLineNumbers = false,
    int indentationCount = 3,
  }) {
    final hexValues =
        map((value) => value.asHex(withPrefix: asValidList, padLeft: 2))
            .toList();

    var line = 0;
    final indent = ' ' * indentationCount;
    final startOfDump = withLineNumbers
        ? '\n↓↓↓↓ [\n${_formatLineNumber(line)}$indent'
        : '\n[\n$indent';
    final buffer = StringBuffer(startOfDump);

    var counter = 1;
    for (var value in hexValues) {
      buffer.write(value);
      if (asValidList) {
        buffer.write(',');
      }

      if (counter % 16 == 0) {
        line++;
        if (counter != hexValues.length) {
          final newLineStart = withLineNumbers
              ? '\n${_formatLineNumber(line)}$indent'
              : '\n$indent';

          buffer.write(newLineStart);
        }
      } else if (counter % 8 == 0) {
        buffer.write('  ');
      } else {
        buffer.write(' ');
      }

      counter++;
    }

    final endOfDump = withLineNumbers ? '\n↑↑↑↑ ]' : '\n]';
    buffer.write(endOfDump);

    return buffer.toString();
  }

  String _formatLineNumber(int line) =>
      line.asHex(withPrefix: false, padLeft: 4);
}
