import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/demo/demo_camera_handle.dart';
import '../../../../camera_control/eos_cine_http/eos_cine_http_camera_handle.dart';
import '../../../../camera_control/eos_ptp_ip/eos_ptp_ip_camera_handle.dart';
import '../../../../camera_control/interface/camera_factory.dart';
import '../../../cine_remote_colors.dart';
import '../../../routes.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../widgets/discovered_camera_item.dart';
import '../widgets/recent_camera_item.dart';

class CameraSelectionPage extends StatelessWidget {
  const CameraSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraConnectionCubit, CameraConnectionState>(
      listener: (context, state) {
        state.maybeWhen(
            connected: (_) =>
                Navigator.of(context).pushNamed(Routes.cameraControl),
            orElse: () {});
      },
      builder: (context, state) => Scaffold(
        backgroundColor: CineRemoteColors.background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(255, 255, 213, 3), // #FCD503
                    Color.fromARGB(255, 176, 127, 18), // 255, 9, 38, 25
                  ],
                  center: Alignment(0, 0.2),
                  stops: [0.3, 0.8],
                  radius: 0.8,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Nearby',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 0.7,
                        height: 250,
                        enableInfiniteScroll: false,
                      ),
                      items: CameraModels.supportedCameras
                          .map(
                            (cameraModel) => DiscoveredCameraItem(
                              cameraModel: cameraModel,
                              isLoading: state.isLoading,
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recents',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Pair Manually'),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        children: [
                          RecentCameraItem(
                            cameraHandle: EosPtpIpCameraHandle(
                              model: CameraModels.canon70D,
                              guid: Uint8List.fromList(
                                  List.generate(16, (index) => 0x00)),
                              address: '192.168.178.43',
                              clientName: 'Cine Remote',
                            ),
                          ),
                          const RecentCameraItem(
                            cameraHandle: EosCineHttpCameraHandle(
                              model: CameraModels.canonC100II,
                            ),
                          ),
                          const RecentCameraItem(
                            cameraHandle: DemoCameraHandle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
