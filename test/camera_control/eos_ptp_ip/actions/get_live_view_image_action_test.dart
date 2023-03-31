import 'package:cine_remote/camera_control/eos_ptp_ip/actions/get_live_view_image_action.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/jpeg_image_extractor.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/operations/get_live_view_image.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/constants/ptp_response_code.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_operation_response.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_response.dart';
import 'package:cine_remote/camera_control/interface/exceptions/camera_communication_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../eos_ptp_ip_mocks.dart';

class MockJpegImageExtractor extends Mock implements JpegImageExtractor {}

class MockGetLiveViewImage extends Mock implements GetLiveViewImage {}

void main() {
  late MockPtpOperationFactory mockOperationFactory;
  late MockGetLiveViewImage mockGetLiveViewImage;
  late MockPtpTransactionQueue mockTransactionQueue;
  late MockJpegImageExtractor mockImageExtractor;

  late GetLiveViewImageAction sut;

  final extractedImageBytes = Uint8List.fromList([0x01, 0x02, 0x03]);

  setUpAll(() {
    registerFallbackValue(Uint8List(0));
  });

  void setupResponse(PtpResponse response) {
    when(() => mockTransactionQueue.handle(mockGetLiveViewImage))
        .thenAnswer((_) async => response);
  }

  setUp(() {
    mockOperationFactory = MockPtpOperationFactory();
    mockGetLiveViewImage = MockGetLiveViewImage();
    mockTransactionQueue = MockPtpTransactionQueue();
    mockImageExtractor = MockJpegImageExtractor();

    when(() => mockOperationFactory.createGetLiveViewImage())
        .thenReturn(mockGetLiveViewImage);

    setupResponse(PtpOperationResponse(
      PtpResponseCode.okay,
      10,
      Uint8List.fromList([0x01, 0x02, 0x03]),
    ));

    when(() => mockImageExtractor.extractFromBytes(any()))
        .thenReturn(extractedImageBytes);

    sut = GetLiveViewImageAction(mockOperationFactory, mockImageExtractor);
  });

  group('GetLiveViewImageAction', () {
    test('calls operationFactory to get GetLiveViewImage operation', () async {
      await sut.run(mockTransactionQueue);

      verify(() => mockOperationFactory.createGetLiveViewImage());
    });

    test('throws when response is no OperationResponse', () {
      setupResponse(FakePtpResponse());

      expect(
        () => sut.run(mockTransactionQueue),
        throwsA(isA<CameraCommunicationException>()),
      );
    });

    test('throws when responseCode not okay', () {
      setupResponse(
          PtpOperationResponse(0x2009, 10, Uint8List.fromList([0x01, 0x02])));

      expect(
        () => sut.run(mockTransactionQueue),
        throwsA(isA<CameraCommunicationException>()),
      );
    });

    test('throws when image cannot be extracted from bytes', () {
      when(() => mockImageExtractor.extractFromBytes(any())).thenReturn(null);

      expect(
        () => sut.run(mockTransactionQueue),
        throwsA(isA<CameraCommunicationException>()),
      );
    });

    test('returns extracted imageBytes', () async {
      final result = await sut.run(mockTransactionQueue);

      expect(result, extractedImageBytes);
    });
  });
}
