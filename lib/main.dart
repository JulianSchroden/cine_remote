import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependencies.dart';
import 'domain/services/camera_remote_service.dart';
import 'presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'presentation/features/camera_control/page/camera_control_page.dart';
import 'presentation/features/camera_selection/page/camera_selection_page.dart';
import 'presentation/features/screen_orientation/bloc/screen_orientation_cubit.dart';
import 'presentation/routes.dart';

void main() {
  registerDependencies();
  runApp(const CineRemote());
}

class CineRemote extends StatelessWidget {
  const CineRemote({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CameraConnectionCubit(
            get<CameraRemoteService>(),
          ),
        ),
        BlocProvider(
          create: (_) => ScreenOrientationCubit()..setForcedOrientation(null),
        )
      ],
      child: MaterialApp(
        title: 'Cine Remote',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          Routes.cameraSelection: (_) => const CameraSelectionPage(),
          Routes.cameraControl: (_) => const CameraControlPage(),
        },
        initialRoute: Routes.cameraSelection,
      ),
    );
  }
}


/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraRemoteService cameraRemoteService = WifiCameraRemoteService();
  CameraHandle? handle;
  Uint8List? imageBytes;
  bool isRecording = false;
  Timer? _timer;

  @override
  void initState() {
    //SystemChrome.setPreferredOrientations(
    //    [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.initState();
  }

  void _connect() async {
    final result = await cameraRemoteService.connect();

    setState(() {
      handle = result;
    });
  }

  void _triggerRecord() async {
    await cameraRemoteService.triggerRecord(handle!);

    setState(() {
      isRecording = !isRecording;
    });
  }

  void _getLiveViewImage() async {
    final stopwatch = Stopwatch();
    stopwatch.start();
    final bytes = await cameraRemoteService.getLiveViewImage(handle!);
    stopwatch.stop();
    print(stopwatch.elapsedMilliseconds);

    setState(() {
      imageBytes = bytes;
    });
  }

  void _startLiveView() async {
    cameraRemoteService.startLiveView(handle!);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) async {
      final stopwatch = Stopwatch();
      stopwatch.start();
      final bytes = await cameraRemoteService.getLiveViewImage(handle!);
      stopwatch.stop();
      print(stopwatch.elapsedMilliseconds);

      setState(() {
        imageBytes = bytes;
      });
    });
  }

  void _stopLiveView() async {
    _timer?.cancel();
    cameraRemoteService.stopLiveView(handle!);
  }

  Widget _buildActions() => Column(
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
            onPressed: _connect,
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
            onPressed: () => _startLiveView(),
            child: const Text(
              'Start LiveView',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () => _stopLiveView(),
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
      );

  @override
  Widget build(BuildContext context) {
    const settingsSpacer = 32.0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'ISO 25600',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: settingsSpacer),
                        Text(
                          '180.00°',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: settingsSpacer),
                        Text(
                          'F2.8',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: settingsSpacer),
                        Text(
                          '5600K',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  if (imageBytes != null)
                    Image.memory(
                      imageBytes!,
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  MaterialButton(
                    shape: const CircleBorder(),
                    color: Colors.green,
                    onPressed: _triggerRecord,
                    child: const SizedBox(
                      width: 72,
                      height: 72,
                    ),
                  ),
                  _buildActions()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/
