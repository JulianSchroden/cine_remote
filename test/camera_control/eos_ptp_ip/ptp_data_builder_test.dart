import 'package:cine_remote/camera_control/eos_ptp_ip/ptp_data_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('build should add length autimatically', () {
    final builder = PtpDataBuilder();

    final result = builder.build();
    expect(result.length, 4);
    expect(result, [0x04, 0x00, 0x00, 0x00]);
  });

  test('add should add bytes', () {
    final builder = PtpDataBuilder();

    builder.add([0x00, 0x01, 0x02]);

    final result = builder.build();
    expect(result.length, 7);
    expect(result, [0x07, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02]);
  });

  test('should add uint32 value in little endian format', () {
    final builder = PtpDataBuilder();

    builder.addUInt32(0x01020304);

    final result = builder.build();
    expect(result.length, 8);
    expect(result, [0x08, 0x00, 0x00, 0x00, 0x04, 0x03, 0x02, 0x01]);
  });

  test('should add uint16 value in little endian format', () {
    final builder = PtpDataBuilder();

    builder.addUInt16(0x0102);

    final result = builder.build();
    expect(result.length, 6);
    expect(result, [0x06, 0x00, 0x00, 0x00, 0x02, 0x01]);
  });

  test('should add string value as nullterminated char array', () {
    final builder = PtpDataBuilder();

    builder.addString("Hello");

    final result = builder.build();
    expect(result.length, 4 + 12);
    expect(result, [
      0x10,
      0x00,
      0x00,
      0x00,
      0x48,
      0x000,
      0x65,
      0x00,
      0x6c,
      0x00,
      0x6c,
      0x0,
      0x6f,
      0x0,
      0x0,
      0x0
    ]);
  });
}
