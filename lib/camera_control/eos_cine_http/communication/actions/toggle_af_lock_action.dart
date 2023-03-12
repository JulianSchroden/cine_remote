import 'package:logging/logging.dart';

import '../../constants/api_endpoint_path.dart';
import '../get_acion.dart';

class ToggleAfLockAction extends GetAction<void> {
  const ToggleAfLockAction(super.httpAdapter);

  @override
  Future<void> call() async {
    final logger = Logger('ToggleAfLockAction');

    final response = await httpAdapter.get(
      ApiEndpointPath.driveLens,
      {'af': 'togglelock'},
    );

    logger.info(
        'ToggleAfLockAction responded with statusCode: ${response.statusCode}');
    logger.info(response.jsonBody);
  }
}
