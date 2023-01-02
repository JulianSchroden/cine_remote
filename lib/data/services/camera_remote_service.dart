import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../domain/models/control_prop_type.dart';
import '../exceptions/camera_connection_exception.dart';
import '../models/wifi_camera_handle.dart';

class CameraRemoteService {
  final String _authority = '192.168.0.80';

  //{"res":"rootredirect"}

  Future<WifiCameraHandle> connect() async {
    final loginUrl = Uri.http(_authority, '/api/acnt/login');
    final response = await _getUrl(loginUrl);

    if (response.statusCode != 200) {
      throw CameraConnectionException(
          'Failed to connect to camera. Status: ${response.statusCode}');
    }

    final body = await response.transform(utf8.decoder).join();
    final json = jsonDecode(body);
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

  Future<void> triggerRecord(WifiCameraHandle handle) async {
    final triggerRecordUrl =
        Uri.http(_authority, '/api/cam/rec', {'cmd': 'trig'});

    final response = await _getUrl(triggerRecordUrl, handle);
    final body = await response.transform(utf8.decoder).join();
    print(body);
  }

  Future<void> setIso(WifiCameraHandle handle, String isoValue) async {
    final response = await _setProp(handle, 'gcv', isoValue);
    final body = await response.transform(utf8.decoder).join();
    print(body);
  }

  Future<void> getIso(WifiCameraHandle handle) async {
    /*
    {"res":"ok","Ogcv":{"pv":"[850]","en":1,"rvn":27,"rv":["320","400","500","640","800","[850]","1000","1250","1600","2000","2500","3200","4000","5000","6400","8000","10000","12800","16000","20000","25600","32000","40000","51200","64000","80000","1024z"]}}
    */
    await _getProp(handle, 'gcv');
  }

  Future<void> getAperture(WifiCameraHandle handle) async {
    /*
    {"res":"ok","Oav":{"pv":"2.8","en":1,"rvn":22,"rv":["2.8","3.2","3.5","4.0","4.5","5.0","5.6","6.3","6.7","7.1","8.0","9.0","9.5","10","11","13","14","16","18","19","20","22"]}}
    */
    await _getProp(handle, 'av');
  }

  Future<void> getShutterAngle(WifiCameraHandle handle) async {
    /*
    {"res":"ok","Ossv":{"pv":"180.00","en":1,"rvn":14,"rv":["360.00","300.00","240.00","180.00","150.00","120.00","90.00","75.00","60.00","45.00","30.00","22.50","15.00","11.25"]}}
    */
    await _getProp(handle, 'ssv');
  }

  Future<void> getWhiteBalance(WifiCameraHandle handle) async {
    /*
    {"res":"ok","Owbv":{"pv":"5600","en":1,"rvn":131,"rv":["2000","2100","2200","2300","2400","2500","2600","2700","2800","2900","3000","3100","3200","3300","3400","3500","3600","3700","3800","3900","4000","4100","4200","4300","4400","4500","4600","4700","4800","4900","5000","5100","5200","5300","5400","5500","5600","5700","5800","5900","6000","6100","6200","6300","6400","6500","6600","6700","6800","6900","7000","7100","7200","7300","7400","7500","7600","7700","7800","7900","8000","8100","8200","8300","8400","8500","8600","8700","8800","8900","9000","9100","9200","9300","9400","9500","9600","9700","9800","9900","10000","10100","10200","10300","10400","10500","10600","10700","10800","10900","11000","11100","11200","11300","11400","11500","11600","11700","11800","11900","12000","12100","12200","12300","12400","12500","12600","12700","12800","12900","13000","13100","13200","13300","13400","13500","13600","13700","13800","13900","14000","14100","14200","14300","14400","14500","14600","14700","14800","14900","15000"]}}
    */
    await _getProp(handle, 'wbv');
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

  Future<HttpClientResponse> _setProp(
      WifiCameraHandle handle, String propKey, String propValue) async {
    final setPropUrl =
        Uri.http(_authority, '/api/cam/setprop', {propKey: propValue});
    return await _getUrl(setPropUrl, handle);
  }

  Future<void> _getProp(WifiCameraHandle handle, String propKey) async {
    final getPropUrl = Uri.http(_authority, '/api/cam/getprop', {'r': propKey});
    final response = await _getUrl(getPropUrl, handle);
    final body = await response.transform(utf8.decoder).join();
    print(body);
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
