import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/models/camera_handle.dart';
import '../../../../camera_control/interface/models/camera_model.dart';
import '../../../../camera_control/interface/models/pairing_data.dart';
import 'json_converter/camera_model_converter.dart';
import 'json_converter/pairing_data_converter.dart';

part 'recent_camera.g.dart';

@JsonSerializable()
class RecentCamera extends Equatable {
  final String id;

  @CameraModelConverter()
  final CameraModel model;

  @PairingDataConverter()
  final PairingData pairingData;

  const RecentCamera({
    required this.id,
    required this.model,
    required this.pairingData,
  });

  factory RecentCamera.fromJson(Map<String, dynamic> json) =>
      _$RecentCameraFromJson(json);

  Map<String, dynamic> toJson() => _$RecentCameraToJson(this);

  @override
  List<Object?> get props => [
        id,
        model,
        pairingData,
      ];
}

extension CameraHandleToRecentCameraExtension on CameraHandle {
  RecentCamera toRecentCamera() {
    return RecentCamera(
      id: id,
      model: model,
      pairingData: pairingData,
    );
  }
}

extension RecentCameraToCameraHandleExtension on RecentCamera {
  CameraHandle toCameraHandle() {
    return CameraHandle(
      id: id,
      model: model,
      pairingData: pairingData,
    );
  }
}
