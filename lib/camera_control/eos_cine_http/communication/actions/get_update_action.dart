import 'package:logging/logging.dart';

import '../../../interface/exceptions/camera_communication_exception.dart';
import '../../../interface/models/camera_update_event.dart';
import '../../../interface/models/control_prop_type.dart';
import '../../../interface/models/properties/auto_focus_mode.dart';
import '../../constants/api_endpoint_path.dart';
import '../../extensions/control_prop_type_extensions.dart';
import '../../models/eos_cine_prop_value.dart';
import '../../models/get_update_response.dart';
import '../get_acion.dart';

class GetUpdateAction extends GetAction<GetUpdateResponse> {
  final int updateSequnce;

  const GetUpdateAction(super.httpAdapter, this.updateSequnce);

  @override
  Future<GetUpdateResponse> call() async {
    final logger = Logger('GetUpdateAction');

    final response = await httpAdapter.get(
      ApiEndpointPath.getUpdate,
      {'seq': updateSequnce.toString()},
    );

    if (!response.isOkay()) {
      throw const CameraCommunicationException('Failed to get updates');
    }

    logger.info(
        'GetUpdateAction responded with statusCode: ${response.statusCode}');
    logger.info(response.jsonBody);

    final List<CameraUpdateEvent> updateEvents = [];
    final recordState = response.jsonBody['rec'];
    if (recordState != null) {
      updateEvents.add(CameraUpdateEvent.recordState(recordState == 'Rec'));
    }

    final ndValue = response.jsonBody['nd'];
    if (ndValue != null) {
      updateEvents.add(CameraUpdateEvent.ndFilter(ndValue));
    }

    for (final propType in ControlPropType.values) {
      final propKey = propType.toKey();
      if (propKey == null) {
        continue;
      }

      final propContent = response.jsonBody['O$propKey'];
      if (propContent != null) {
        final propValue = propContent['pv'];
        if (propValue != null) {
          updateEvents.add(CameraUpdateEvent.propValueChanged(
              propType, EosCinePropValue(propValue)));
        }
      }
    }

    final focusSwitch = response.jsonBody['cbtn'];
    if (focusSwitch != null) {
      AutoFocusMode? mapFocusMode(String focusSwitch) {
        const String manualFocus = 'f0i1af3ai1fm1';
        const String continuesFocus = 'f0i1af4ai1fm1';
        const String oneShotFocus = 'f1i1af1ai1fm1';
        switch (focusSwitch) {
          case manualFocus:
            return AutoFocusMode.off;
          case oneShotFocus:
            return AutoFocusMode.oneShot;
          case continuesFocus:
            return AutoFocusMode.continues;
        }

        return null;
      }

      final focusMode = mapFocusMode(focusSwitch);
      if (focusMode != null) {
        updateEvents.add(CameraUpdateEvent.focusMode(focusMode));
      }
    }

    return GetUpdateResponse(
      cameraEvents: updateEvents,
      updateSequnce: response.jsonBody['seq'],
    );
  }
}
