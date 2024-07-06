import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_camera.g.dart';

@JsonSerializable()
class RecentCamera extends Equatable {
  final String id;

  @CameraModelConverter()
  final CameraModel model;

  @PairingDataConverter()
  final PairingData pairingData;

  final DateTime lastUsed;

  const RecentCamera({
    required this.id,
    required this.model,
    required this.pairingData,
    required this.lastUsed,
  });

  factory RecentCamera.fromJson(Map<String, dynamic> json) =>
      _$RecentCameraFromJson(json);

  Map<String, dynamic> toJson() => _$RecentCameraToJson(this);

  @override
  List<Object?> get props => [
        id,
        model,
        pairingData,
        lastUsed,
      ];
}

extension CameraHandleToRecentCameraExtension on CameraConnectionHandle {
  RecentCamera toRecentCamera(DateTime lastUsed) {
    return RecentCamera(
      id: id,
      model: model,
      pairingData: pairingData,
      lastUsed: lastUsed,
    );
  }
}

extension RecentCameraToCameraHandleExtension on RecentCamera {
  CameraConnectionHandle toCameraHandle() {
    return CameraConnectionHandle(
      id: id,
      model: model,
      pairingData: pairingData,
    );
  }
}
