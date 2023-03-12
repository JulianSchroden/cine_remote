import 'package:logging/logging.dart';

import '../../constants/api_endpoint_path.dart';
import '../get_acion.dart';

class StartLiveViewAction extends GetAction<void> {
  const StartLiveViewAction(super.httpAdapter);

  @override
  Future<void> call() async {
    final logger = Logger('StartLiveViewAction');

    final response = await httpAdapter.get(
      ApiEndpointPath.liveViewControl,
      {'cmd': 'start', 'sz': 'l'},
    );

    logger.info(
        'StartLiveViewAction responded with statusCode: ${response.statusCode}');
    logger.info(response.jsonBody);
  }
}
