import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_remote/data/services/ptp_ip_camera_remote_service.dart';
import 'package:cine_remote/presentation/core/widgets/rounded_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config.dart';
import '../../../cine_remote_colors.dart';
import '../../../routes.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../widgets/camera_selection_item.dart';

class CameraSelectionPage extends StatelessWidget {
  final Config config;

  const CameraSelectionPage({required this.config, super.key});

  void tryToConnect() {
    try {
      final service = PtpIpCameraRemoteService();
      service.connect();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraConnectionCubit, CameraConnectionState>(
      listener: (context, state) {
        state.maybeWhen(
            connectionEstablished: ((_) =>
                Navigator.of(context).pushNamed(Routes.cameraControl)),
            orElse: () {});
      },
      builder: (context, state) => Scaffold(
        backgroundColor: CineRemoteColors.background,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 48),
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.7,
                    height: 260,
                    enableInfiniteScroll: false,
                  ),
                  items: config.supportedCameras
                      .map(
                        (cameraModel) => CameraSelectionItem(
                          cameraModel: cameraModel,
                          isLoading: state.isLoading,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16),
                RoundedTextButton(
                  text: "TCP Test",
                  onPressed: () {
                    print("On Button pressed");
                    tryToConnect();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
