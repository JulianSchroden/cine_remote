import '../../../interface/exceptions/unsupported_prop_exception.dart';
import '../../../interface/models/control_prop.dart';
import '../../../interface/models/control_prop_type.dart';
import '../../constants/api_endpoint_path.dart';
import '../../extensions/control_prop_type_extensions.dart';
import '../../models/eos_cine_prop_value.dart';
import '../get_acion.dart';

class GetPropAction extends GetAction<ControlProp?> {
  final ControlPropType propType;

  const GetPropAction(super.httpAdapter, this.propType);

  @override
  Future<ControlProp?> call() async {
    final propKey = propType.toKey();
    if (propKey == null) {
      throw UnsupportedPropException('Cannot get property $propType');
    }

    final response = await httpAdapter.get(
      ApiEndpointPath.getProp,
      {'r': propKey},
    );

    final propContent = response.jsonBody['O$propKey'];
    return ControlProp(
      type: propType,
      currentValue: EosCinePropValue(propContent['pv']),
      allowedValues: List<String>.from(propContent['rv'])
          .map((value) => EosCinePropValue(value))
          .toList(),
    );
  }
}
