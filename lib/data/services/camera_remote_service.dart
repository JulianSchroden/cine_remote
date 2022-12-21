import 'dart:convert';
import 'dart:io';

import '../exceptions/camera_connection_exception.dart';
import '../models/wifi_camera_handle.dart';

class CameraRemoteService {
  final String _authority = '192.168.0.80';

  Future<WifiCameraHandle> connect() async {
    final loginUrl = Uri.http(_authority, '/api/acnt/login');
    final response = await _getUrl(loginUrl);

     if(response.statusCode != 200) {
      throw CameraConnectionException('Failed to connect to camera. Status: ${response.statusCode}');
     }

    final body = await response.transform(utf8.decoder).join();
    final json = jsonDecode(body);
    final connectResponse = json['res'];
    if(connectResponse != 'ok') {
      throw CameraConnectionException('Could not establish connection: $connectResponse');
    }

    return WifiCameraHandle(cookies: response.cookies);
  }

  Future<void> triggerRecord(WifiCameraHandle handle) async {
    final triggerRecordUrl = Uri.http(_authority, '/api/cam/rec', {'cmd': 'trig'});

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
    await _getProp(handle, 'gcv');
  }


  Future<HttpClientResponse> _setProp(WifiCameraHandle handle, String propKey, String propValue) async {
    final setPropUrl = Uri.http(_authority, '/api/cam/setprop', {propKey: propValue});
    return await _getUrl(setPropUrl, handle);
  }

  Future<void> _getProp(WifiCameraHandle handle, String propKey) async {
    final getPropUrl = Uri.http(_authority, '/api/cam/getprop', {'r': propKey});
    final response = await _getUrl(getPropUrl, handle);
    final body = await response.transform(utf8.decoder).join();
    print(body);
  }

  Future<HttpClientResponse> _getUrl(Uri url, [WifiCameraHandle? handle]) async{
    final client = HttpClient();
    final request = await client.getUrl(url);
    if(handle != null) {
       request.cookies.addAll(handle.cookies);
    }

    final response = await request.close();
    client.close();
    return response;
  }
}