import 'package:equatable/equatable.dart';

class CameraInfo extends Equatable {
  final int language;
  final String productId;

  const CameraInfo({
    required this.language,
    required this.productId,
  });

  factory CameraInfo.fromJson(Map<String, dynamic> json) =>
      CameraInfo(language: json['lang'], productId: json['productId']);

  @override
  List<Object?> get props => [language, productId];
}
