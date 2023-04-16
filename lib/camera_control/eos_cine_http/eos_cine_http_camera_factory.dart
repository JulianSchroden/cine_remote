import 'dart:io';

import '../interface/camera.dart';
import '../interface/camera_factory.dart';
import '../interface/exceptions/camera_communication_exception.dart';
import '../interface/models/camera_handle.dart';
import 'adapter/http_adapter_factory.dart';
import 'adapter/http_client_factory.dart';
import 'communication/action_factory.dart';
import 'eos_cine_http_camera.dart';
import 'eos_cine_http_camera_pairing_data.dart';

class EosCineHttpCameraFactory
    extends CameraFactory<EosCineHttpCameraPairingData> {
  final HttpClientFactory clientFactory;
  final HttpAdapterFactory adaperFactory;
  final ActionFactory actionFactory;

  EosCineHttpCameraFactory([
    this.clientFactory = const DefaultHttpClientFactory(),
    this.adaperFactory = const DefaultHttpAdapterFactory(),
    this.actionFactory = const ActionFactory(),
  ]);

  @override
  Future<Camera> connect(CameraHandle handle) async {
    final pairingData = handle.pairingData as EosCineHttpCameraPairingData;

    final client = await clientFactory.create();
    final httpAdapter = await adaperFactory.create(client, pairingData.address);

    final loginAction = actionFactory.createLoginAction(httpAdapter);
    final loginResponse = await loginAction();
    if (!loginResponse.isOkay()) {
      throw const CameraCommunicationException('Failed to acquire auth cookie');
    }

    httpAdapter.addCookies(loginResponse.cookies);

    final getInfoAction = actionFactory.createGetInfoAction(httpAdapter);
    final cameraInfo = await getInfoAction();
    httpAdapter.addCookies([
      Cookie('productId', cameraInfo.productId),
      Cookie('brlang', cameraInfo.language.toString()),
    ]);

    return EosCineHttpCamera(httpAdapter);
  }
}
