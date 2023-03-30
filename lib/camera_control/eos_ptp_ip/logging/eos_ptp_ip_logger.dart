import '../../common/logging/base_camera_control_logger.dart';
import 'topics/eos_event_topics.dart';
import 'topics/transaction_queue_topics.dart';

class EosPtpIpLogger extends BaseCameraControlLogger
    with EosTransactionQueueLogger, EosEventLogger {}
