import 'package:json_annotation/json_annotation.dart';

import '../../../../../camera_control/interface/models/camera_model.dart';

class CameraModelConverter
    implements JsonConverter<CameraModel, Map<String, dynamic>> {
  const CameraModelConverter();

  @override
  CameraModel fromJson(Map<String, dynamic> json) {
    return CameraModel(
      identifier: json['identifier'],
      name: json['name'],
      protocol: json['protocol'],
    );
  }

  @override
  Map<String, dynamic> toJson(CameraModel model) {
    return <String, dynamic>{
      'identifier': model.identifier,
      'name': model.name,
      'protocol': model.protocol,
    };
  }
}
