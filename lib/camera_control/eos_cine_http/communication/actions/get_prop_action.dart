import '../../../interface/models/control_prop.dart';
import '../../../interface/models/control_prop_type.dart';
import '../../constants/api_endpoint_path.dart';
import '../../extensions/control_prop_type_extensions.dart';
import '../get_acion.dart';

class GetPropAction extends GetAction<ControlProp?> {
  final ControlPropType propType;

  const GetPropAction(super.httpAdapter, this.propType);

  @override
  Future<ControlProp?> call() async {
    final propKey = propType.toKey();
    final response = await httpAdapter.get(
      ApiEndpointPath.getProp,
      {'r': propKey},
    );

    final propContent = response.jsonBody['O$propKey'];
    return ControlProp(
      type: propType,
      currentValue: propContent['pv'],
      allowedValues: List<String>.from(propContent['rv']),
    );
  }
}
