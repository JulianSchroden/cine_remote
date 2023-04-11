import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../camera_control/interface/camera_factory.dart';
import 'camera_discovery_item.dart';

class CameraDisoveryCard extends StatelessWidget {
  const CameraDisoveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(255, 255, 213, 3),
            Color.fromARGB(255, 176, 127, 18),
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
                    (cameraModel) => CameraDiscoveryItem(
                      cameraModel: cameraModel,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
