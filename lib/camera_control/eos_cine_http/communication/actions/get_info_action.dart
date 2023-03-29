import '../../../interface/exceptions/camera_communication_exception.dart';
import '../../constants/api_endpoint_path.dart';
import '../../models/camera_info.dart';
import '../get_acion.dart';

class GetInfoAction extends GetAction<CameraInfo> {
  const GetInfoAction(super.httpAdapter);

  @override
  Future<CameraInfo> call() async {
    final response = await httpAdapter.get(ApiEndpointPath.getInfo);
    if (!response.isOkay()) {
      throw const CameraCommunicationException('Failed to get info');
    }

    return CameraInfo.fromJson(response.jsonBody);
  }
}
