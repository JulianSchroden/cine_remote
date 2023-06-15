## 2023-06-15 v.0.3.1+5
- EOS/PTP IP
  - Add facetracking touch autofocus status
  - Fix autofocus status mapping causing error when value not known
- Add Firebase to project
- Setup Firebase crashlytics to report uncaught exceptions

## 2023-06-11 v.0.3.0+4
- UI
  - Rework all pages to support landscape mode 
  - Camera control page:
    - Move capture button next to live view player
    - Remove auto-hiding live view play/pause button
    - Add live view toggle to menu
- EOS/PTP IP:
  - Add support for touch to focus
  - Improve pairing flow:
    - increase connection timeout while pairing
    - show error card when pairing fails
- Restart camera discovery when camera disconnects
- Add option to transfer pairing data

## 2023-05-13 v.0.2.1+3
- Update camera discovery to detect when the camera is not available anymore
- Updated flutter to 3.1.0
- Handle AllowedValuesChanged events so the app behaves correctly in modes other than manual
- Detect camera disconnects and route back to the selection page when the app loses connection to the camera

## 2023-04-23 v.0.2.0+2
- Added GitHub workflow to publish iOS builds to Testflight automatically

## 2023-04-21 v.0.2.0+1
- Added support for controlling the Canon EOS 70D using `PTP/IP`
  - Device pairing
  - Property control (iso, shutter speed, aperture, white balance)
  - Image capturing
  - Event handling
- Added camera discovery
  - EOS PTP/IP: Using `Universal Plug and Play`
  - Eos C100 II: Based on device and gateway IP address
- Moved all camera-control related files into `camera_control` directory
- Added configurable logger topics
   ```dart
    // configure logger topics
    CameraControlLoggerConfig.init(enabledTopics: [
      // show event logs and format data as valid dart list
      const EosPtpRawEventLoggerTopic(dumpDataAsValidList: true),
    ]);
   ```
- Updated iOS build settings for the inital Testflight release

## 2023-03-07 v.0.1.0
- Initial version with support for the Canon EOS C100 II
  - Property control (iso, shutter angle, aperture, white balance)
  - Start and stop recording
  - Live view
  - Event handling (e. g. ISO changed on camera)
- Demo mode