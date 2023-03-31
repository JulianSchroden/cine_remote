import 'package:cine_remote/camera_control/eos_ptp_ip/communication/operations/ptp_operation_factory.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/ptp_transaction_queue.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_response.dart';
import 'package:mocktail/mocktail.dart';

class MockPtpOperationFactory extends Mock implements PtpOperationFactory {}

class MockPtpTransactionQueue extends Mock implements PtpTransactionQueue {}

class FakePtpResponse extends Fake implements PtpResponse {}
