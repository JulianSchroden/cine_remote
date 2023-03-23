import '../../interface/models/control_prop_type.dart';
import '../adapter/http_adapter.dart';
import '../models/eos_cine_prop_value.dart';
import 'actions/get_info_action.dart';
import 'actions/get_live_view_image_action.dart';
import 'actions/get_prop_action.dart';
import 'actions/get_update_action.dart';
import 'actions/login_action.dart';
import 'actions/set_prop_action.dart';
import 'actions/start_live_view_action.dart';
import 'actions/stop_live_view_action.dart';
import 'actions/toggle_af_lock_action.dart';
import 'actions/trigger_record_action.dart';

class ActionFactory {
  const ActionFactory();

  LoginAction createLoginAction(HttpAdapter httpAdapter) =>
      LoginAction(httpAdapter);

  GetPropAction createGetPropAction(
    HttpAdapter httpAdapter,
    ControlPropType propType,
  ) =>
      GetPropAction(httpAdapter, propType);

  SetPropAction createSetPropAction(
    HttpAdapter httpAdapter,
    ControlPropType propType,
    EosCinePropValue value,
  ) =>
      SetPropAction(httpAdapter, propType, value);

  TriggerRecordAction createTriggerRecordAction(HttpAdapter httpAdapter) =>
      TriggerRecordAction(httpAdapter);

  ToggleAfLockAction createToggleAfLockAction(HttpAdapter httpAdapter) =>
      ToggleAfLockAction(httpAdapter);

  GetUpdateAction createGetUpdateAction(
    HttpAdapter httpAdapter,
    int updateSequnce,
  ) =>
      GetUpdateAction(httpAdapter, updateSequnce);

  StartLiveViewAction createStartLiveViewAction(HttpAdapter httpAdapter) =>
      StartLiveViewAction(httpAdapter);

  StopLiveViewAction createStopLiveViewAction(HttpAdapter httpAdapter) =>
      StopLiveViewAction(httpAdapter);

  GetLiveViewImageAction createGetLiveViewImageAction(
          HttpAdapter httpAdapter) =>
      GetLiveViewImageAction(httpAdapter);

  GetInfoAction createGetInfoAction(HttpAdapter httpAdapter) =>
      GetInfoAction(httpAdapter);
}
