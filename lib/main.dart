import 'dart:io';

import 'package:cine_remote/data/models/wifi_camera_handle.dart';
import 'package:cine_remote/data/services/camera_remote_service.dart';
import 'package:flutter/material.dart';

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

  void _getNetworkInfo() async {
    final result = await cameraRemoteService.connect();

    setState(() {
      handle = result;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cine Remote'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(handle?.cookies.join() ?? 'not connected'),
              MaterialButton(
                onPressed: _getNetworkInfo,
                child: const Text('Connect to Camera'),
              ),
              MaterialButton(onPressed: () => cameraRemoteService.triggerRecord(handle!), 
              child: const Text('Trigger Record'),),
              MaterialButton(onPressed: () => cameraRemoteService.setIso(handle!, '[850]'), 
              child: const Text('Set ISO'),),
              MaterialButton(onPressed: () => cameraRemoteService.getIso(handle!), 
              child: const Text('Get ISO'),)
            ],
          ),
        ));
  }
}
