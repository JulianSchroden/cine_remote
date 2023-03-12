import 'package:logging/logging.dart';

import '../../constants/api_endpoint_path.dart';
import '../get_acion.dart';

class StopLiveViewAction extends GetAction<void> {
  const StopLiveViewAction(super.httpAdapter);

  @override
  Future<void> call() async {
    final logger = Logger('StopLiveViewAction');

    final response = await httpAdapter.get(
      ApiEndpointPath.liveViewControl,
      {'cmd': 'stop'},
    );

    logger.info(
        'StopLiveViewAction responded with statusCode: ${response.statusCode}');
    logger.info(response.jsonBody);
  }
}
