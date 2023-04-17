// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_camera.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentCamera _$RecentCameraFromJson(Map<String, dynamic> json) => RecentCamera(
      id: json['id'] as String,
      model: const CameraModelConverter()
          .fromJson(json['model'] as Map<String, dynamic>),
      pairingData: const PairingDataConverter()
          .fromJson(json['pairingData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentCameraToJson(RecentCamera instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': const CameraModelConverter().toJson(instance.model),
      'pairingData': const PairingDataConverter().toJson(instance.pairingData),
    };
