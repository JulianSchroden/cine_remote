import 'exposure_mode.dart';

class CameraMode {
  final ExposureMode exposureMode;

  const CameraMode(this.exposureMode);

  const factory CameraMode.photo(ExposureMode exposureMode) = PhotoMode;
  const factory CameraMode.video(ExposureMode exposureMode) = VideoMode;
}

class PhotoMode extends CameraMode {
  const PhotoMode(super.exposureMode);
}

class VideoMode extends CameraMode {
  const VideoMode(super.exposureMode);
}
