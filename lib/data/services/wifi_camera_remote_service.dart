import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../domain/models/auto_focus_mode.dart';
import '../../domain/models/camera_update_event.dart';
import '../../domain/models/camera_update_response.dart';
import '../../domain/models/control_prop.dart';
import '../../domain/models/control_prop_type.dart';
import '../../domain/services/camera_remote_service.dart';
import '../exceptions/camera_connection_exception.dart';
import '../extensions/control_prop_type_extensions.dart';
import '../models/camera_info.dart';
import '../models/wifi_camera_handle.dart';
import 'http_adapter.dart';

class WifiCameraRemoteService extends CameraRemoteService<WifiCameraHandle> {
  final HttpAdapter httpAdapter;

  WifiCameraRemoteService(this.httpAdapter);
  final String _authority = '192.168.0.80';

  @override
  Future<WifiCameraHandle> connect() async {
    const loginPath = '/api/acnt/login';
    final response = await httpAdapter.get(null, loginPath);

    if (!response.isOkay()) {
      throw CameraConnectionException(
          'Failed to connect to camera. Status: ${response.statusCode}');
    }

    final cameraHandle = WifiCameraHandle(
      cookies: response.cookies,
      supportedProps: const [
        ControlPropType.aperture,
        ControlPropType.iso,
        ControlPropType.shutterAngle,
        ControlPropType.whiteBalance,
      ],
    );

    final cameraInfo = await getInfo(cameraHandle);
    return cameraHandle.copyWith(cookies: [
      Cookie('productId', cameraInfo.productId),
      Cookie('brlang', cameraInfo.language.toString()),
      ...cameraHandle.cookies
    ]);
  }

  @override
  Future<ControlProp?> getProp(
    WifiCameraHandle handle,
    ControlPropType propType,
  ) async {
    const getPropPath = '/api/cam/getprop';
    final propKey = propType.toKey();
    final response = await httpAdapter.get(
      handle,
      getPropPath,
      {'r': propKey},
    );

    final propContent = response.jsonBody['O$propKey'];
    return ControlProp(
      type: propType,
      currentValue: propContent['pv'],
      allowedValues: List<String>.from(propContent['rv']),
    );
  }

  @override
  Future<void> setProp(
    WifiCameraHandle handle,
    ControlPropType propType,
    String value,
  ) async {
    const setPropPath = '/api/cam/setprop';
    final response =
        await httpAdapter.get(handle, setPropPath, {propType.toKey(): value});
    print(response.jsonBody);
  }

  @override
  Future<void> triggerRecord(WifiCameraHandle handle) async {
    const triggerRecordPath = '/api/cam/rec';
    final response =
        await httpAdapter.get(handle, triggerRecordPath, {'cmd': 'trig'});

    print(response.jsonBody);
  }

  @override
  Future<void> toggleAfLock(WifiCameraHandle handle) async {
    const toggleAfLockPath = '/api/cam/drivelens';
    final response =
        await httpAdapter.get(handle, toggleAfLockPath, {'af': 'togglelock'});
    print(response.jsonBody);
  }

  @override
  Future<CameraUpdateResponse> getUpdate(WifiCameraHandle handle) async {
    const getUpdatePath = '/api/cam/getcurprop';
    final response = await httpAdapter
        .get(handle, getUpdatePath, {'seq': handle.updateCounter.toString()});

    if (!response.isOkay()) {
      throw CameraConnectionException('Failed to get updates');
    }

    print(response.jsonBody);
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
      final propContent = response.jsonBody['O$propKey'];
      if (propContent != null) {
        final propValue = propContent['pv'];
        if (propValue != null) {
          updateEvents.add(CameraUpdateEvent.prop(propType, propValue));
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

    return CameraUpdateResponse(
      cameraHandle: handle.copyWith(updateCounter: response.jsonBody['seq']),
      cameraEvents: updateEvents,
    );
  }

  Future<CameraInfo> getInfo(WifiCameraHandle cameraHandle) async {
    const getInfoPath = '/api/sys/getdevinfo';
    final response = await httpAdapter.get(cameraHandle, getInfoPath);
    if (!response.isOkay()) {
      throw CameraConnectionException('Failed to get info');
    }

    return CameraInfo.fromJson(response.jsonBody);
  }

  //  http://192.168.0.80/api/cam/setlang?lang=0
  //  http://192.168.0.80/api/cam/getcurprop?seq=0

  // busy, failparam, rootredirect

  // http://192.168.0.80/api/cam/getcurprop?seq=5
  // no change: {"res":"ok","seq":6,"com":2}
  // initial response: {
  //    "res":"ok",
  //    "seq":1,
  //    "mode":"Ctrl",
  //    "rec":"Stby",
  //    "com":1,
  //    "batt":-1, // -1 = plugged in; 1 = low?
  //    "tc":"02:27:25:23",
  //    "cbtn":"f0i1af4ai1fm1",
  //    "camid":"C100II  ",
  //    "Ocf":{"sel":"A","artime":132,"brtime":-1}, // artime: record time on sdCard
  //    "Owbm":{"pv":"Kelvin","en":1},
  //    "Owbv":{"pv":"4100","en":1},
  //    "Oav":{"pv":"2.2","en":1},
  //    "Ossm":{"pv":"angle","en":1},
  //    "Ossv":{"pv":"240.00","en":1},
  //    "Ogcm":{"pv":"iso","en":1},
  //    "Ogcv":{"pv":"4000","en":1},
  //    "Oam":{"pv":"Manual","en":0},
  //    "nd":0,
  //    "fframe":"contin",
  //    "pushai":"stop",
  //    "aes":"non",
  //    "aesbtn":"PM",
  //    "faceficon":"off"}

  // aperture changed: {"res":"ok","seq":6,"com":2,"cbtn":"f0i1af4ai1fm1","Oav":{"pv":"2.2","en":1},"Oam":{"pv":"Manual","en":0}}
  // iso changed: {"res":"ok","seq":8,"com":5,"Ogcm":{"pv":"iso","en":1},"Ogcv":{"pv":"4000","en":1}}
  // shutter angle changed: {"res":"ok","seq":9,"com":3,"Ossm":{"pv":"angle","en":1},"Ossv":{"pv":"240.00","en":1}}
  // white balance changed:
  // Mode: Auto White Balance: {"res":"ok","seq":16,"com":5,"Owbm":{"pv":"AWB","en":1},"Owbv":{"pv":"6500","en":0}}
  // Mode: Kelvin: {"res":"ok","seq":27,"com":5,"Owbm":{"pv":"Kelvin","en":1},"Owbv":{"pv":"4100","en":1}}
  // Mode: Preset {"res":"ok","seq":23,"com":9,"Owbm":{"pv":"Tungsten","en":1},"Owbv":{"pv":"0","en":1}}
  // record started: {"res":"ok","seq":41,"rec":"Rec","com":2,"tc":"02:27:17:10"}
  // record stopped: {"res":"ok","seq":50,"rec":"Stby","com":1,"tc":"02:27:25:23"}
  // nd filter changed: {"res":"ok","seq":2,"com":10,"nd":6}
  // disable auto focus on lens: {"res":"ok","seq":8,"com":10,"cbtn":"f0i1af3ai1fm1","fframe":"off"}
  // enable auto focus on lens: {"res":"ok","seq":9,"com":7,"cbtn":"f0i1af4ai1fm1","fframe":"contin"}
  // change af mode to continues: {"res":"ok","seq":13,"com":1,"cbtn":"f0i1af4ai1fm1","fframe":"contin"}
  // change af mode to one shot: {"res":"ok","seq":14,"com":8,"cbtn":"f1i1af1ai1fm1","fframe":"off"}

  // change focus:
  // far:
  // http://192.168.0.80/api/cam/drivelens?fl=far1
  // http://192.168.0.80/api/cam/drivelens?fl=far2
  // http://192.168.0.80/api/cam/drivelens?fl=far3
  // {"res":"ok"}
  //
  // http://192.168.0.80/api/cam/drivelens?fl=near1
  // http://192.168.0.80/api/cam/drivelens?fl=near2
  // http://192.168.0.80/api/cam/drivelens?fl=near3
  // {"res":"ok"}

  @override
  Future<void> startLiveView(WifiCameraHandle handle) async {
    const liveViewControlPath = 'api/cam/lv';
    final response = await httpAdapter
        .get(handle, liveViewControlPath, {'cmd': 'start', 'sz': 'l'});
    print(response.jsonBody);
  }

  @override
  Future<void> stopLiveView(WifiCameraHandle handle) async {
    const liveViewControlPath = 'api/cam/lv';
    final response =
        await httpAdapter.get(handle, liveViewControlPath, {'cmd': 'stop'});
    print(response.jsonBody);
  }

  @override
  Future<Uint8List> getLiveViewImage(WifiCameraHandle handle) async {
    final timeStamp = DateTime.now().toIso8601String();
    final liveViewGetImageUrl =
        Uri.http(_authority, 'api/cam/lvgetimg', {'d': timeStamp});
    final response = await _getUrl(liveViewGetImageUrl, handle);
    return await consolidateHttpClientResponseBytes(response);
  }

  Future<HttpClientResponse> _getUrl(Uri url,
      [WifiCameraHandle? handle]) async {
    final client = HttpClient();
    final request = await client.getUrl(url);
    if (handle != null) {
      request.cookies.addAll(handle.cookies);
    }

    final response = await request.close();
    client.close();
    return response;
  }
}
