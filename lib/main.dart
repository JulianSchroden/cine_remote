import 'dart:io';

import 'package:cine_remote/data/models/wifi_camera_handle.dart';
import 'package:cine_remote/data/services/camera_remote_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraRemoteService cameraRemoteService = CameraRemoteService();
  WifiCameraHandle? handle;
  Uint8List? imageBytes;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.initState();
  }

  void _getNetworkInfo() async {
    final result = await cameraRemoteService.connect();

    setState(() {
      handle = result;
    });
  }

  void _getLiveViewImage() async {
    final bytes = await cameraRemoteService.getLiveViewImage(handle!);

    setState(() {
      imageBytes = bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            if (imageBytes != null)
              Container(
                color: Colors.black,
                child: Image.memory(
                  imageBytes!,
                  width: screenSize.width,
                  height: screenSize.height,
                  fit: BoxFit.contain,
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Connection State:',
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(width: 8),
                    Text(handle?.cookies.join() ?? 'not connected',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                MaterialButton(
                  onPressed: _getNetworkInfo,
                  child: const Text(
                    'Connect to Camera',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () => cameraRemoteService.triggerRecord(handle!),
                  child: const Text(
                    'Trigger Record',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () => cameraRemoteService.setIso(handle!, '25600'),
                  child: const Text(
                    'Set ISO',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                /*
              MaterialButton(
                onPressed: () => cameraRemoteService.getIso(handle!),
                child: const Text(
                  'Get ISO',
                  style: TextStyle(color: Colors.white),
                ),
              ),
                MaterialButton(
                  onPressed: () => cameraRemoteService.getAperture(handle!),
                  child: const Text(
                    'Get Aperture',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () => cameraRemoteService.getShutterAngle(handle!),
                  child: const Text(
                    'Get ShutterAngle',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () => cameraRemoteService.getWhiteBalance(handle!),
                  child: const Text(
                    'Get WhiteBalance',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                */
                MaterialButton(
                  onPressed: () => cameraRemoteService.startLiveView(handle!),
                  child: const Text(
                    'Start LiveView',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () => cameraRemoteService.stopLiveView(handle!),
                  child: const Text(
                    'Stop LiveView',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () => _getLiveViewImage(),
                  child: const Text(
                    'Get LiveView Image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
