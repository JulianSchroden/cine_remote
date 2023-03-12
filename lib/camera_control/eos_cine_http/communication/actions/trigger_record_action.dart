import 'package:logging/logging.dart';

import '../../constants/api_endpoint_path.dart';
import '../get_acion.dart';

class TriggerRecordAction extends GetAction<void> {
  const TriggerRecordAction(super.httpAdapter);

  @override
  Future<void> call() async {
    final logger = Logger('TriggerRecordAction');

    final response = await httpAdapter.get(
      ApiEndpointPath.record,
      {'cmd': 'trig'},
    );

    logger.info(
        'TriggerRecordAction responded with statusCode: ${response.statusCode}');
    logger.info(response.jsonBody);
  }
}
