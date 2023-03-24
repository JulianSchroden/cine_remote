import 'dart:typed_data';

Iterable flatten(Iterable iterable) =>
    iterable.expand((e) => e is List ? flatten(e) : [e]);

Uint8List flattenBytes(Iterable structuredBytes) {
  final flattenedBytes = flatten(structuredBytes);

  return Uint8List.fromList(List.from(flattenedBytes));
}
