import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../domain/models/control_prop.dart';
import '../../domain/models/control_prop_type.dart';
import '../../domain/services/camera_remote_service.dart';
import '../exceptions/camera_connection_exception.dart';
import '../extensions/control_prop_type_extensions.dart';
import '../models/wifi_camera_handle.dart';
import 'http_adapter.dart';

class WifiCameraRemoteService extends CameraRemoteService<WifiCameraHandle> {
  final HttpAdapter httpAdapter;

  WifiCameraRemoteService(this.httpAdapter);
  final String _authority = '192.168.0.80';

  //{"res":"rootredirect"}

  @override
  Future<WifiCameraHandle> connect() async {
    const loginPath = '/api/acnt/login';
    final response = await httpAdapter.get(null, loginPath);

    if (response.statusCode != 200) {
      throw CameraConnectionException(
          'Failed to connect to camera. Status: ${response.statusCode}');
    }

    final json = response.jsonBody;
    final connectResponse = json['res'];
    if (connectResponse != 'ok') {
      throw CameraConnectionException(
          'Could not establish connection: $connectResponse');
    }

    return WifiCameraHandle(
      cookies: response.cookies,
      supportedProps: [
        ControlPropType.aperture,
        ControlPropType.iso,
        ControlPropType.shutterAngle,
        ControlPropType.whiteBalance,
      ],
    );
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

  Future<void> startLiveView(WifiCameraHandle handle) async {
    final liveViewUrl =
        Uri.http(_authority, 'api/cam/lv', {'cmd': 'start', 'sz': 'l'});
    final response = await _getUrl(liveViewUrl, handle);
    final body = await response.transform(utf8.decoder).join();
    print(body);
  }

  Future<void> stopLiveView(WifiCameraHandle handle) async {
    final liveViewUrl = Uri.http(_authority, 'api/cam/lv', {'cmd': 'stop'});
    final response = await _getUrl(liveViewUrl, handle);
    final body = await response.transform(utf8.decoder).join();
    print(body);
  }

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
