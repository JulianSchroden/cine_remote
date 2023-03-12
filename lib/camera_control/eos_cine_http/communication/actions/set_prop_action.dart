import 'package:logging/logging.dart';

import '../../../interface/models/control_prop_type.dart';
import '../../constants/api_endpoint_path.dart';
import '../../extensions/control_prop_type_extensions.dart';
import '../get_acion.dart';

class SetPropAction extends GetAction<void> {
  final ControlPropType propType;
  final String value;

  const SetPropAction(super.httpAdapter, this.propType, this.value);

  @override
  Future<void> call() async {
    final logger = Logger('SetPropAction');

    final response = await httpAdapter.get(
      ApiEndpointPath.setProp,
      {propType.toKey(): value},
    );
    logger.info(
        'SetPropAction responded with statusCode: ${response.statusCode}');
    logger.info(response.jsonBody);
  }
}
