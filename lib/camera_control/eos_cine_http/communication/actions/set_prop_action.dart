import 'package:logging/logging.dart';

import '../../../interface/exceptions/unsupported_prop_exception.dart';
import '../../../interface/models/control_prop_type.dart';
import '../../constants/api_endpoint_path.dart';
import '../../extensions/control_prop_type_extensions.dart';
import '../../models/eos_cine_prop_value.dart';
import '../get_acion.dart';

class SetPropAction extends GetAction<void> {
  final ControlPropType propType;
  final EosCinePropValue value;

  const SetPropAction(super.httpAdapter, this.propType, this.value);

  @override
  Future<void> call() async {
    final logger = Logger('SetPropAction');
    final propKey = propType.toKey();
    if (propKey == null) {
      throw UnsupportedPropException('Cannot set property $propType to $value');
    }

    final response = await httpAdapter.get(
      ApiEndpointPath.setProp,
      {propType.toKey()!: value.nativeValue},
    );
    logger.info(
        'SetPropAction responded with statusCode: ${response.statusCode}');
    logger.info(response.jsonBody);
  }
}
