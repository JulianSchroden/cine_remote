import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/camera_discovery_cubit.dart';
import 'camera_discovery_item.dart';

class CameraDisoveryCard extends StatelessWidget {
  const CameraDisoveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraDiscoveryCubit, CameraDiscoveryState>(
      builder: (context, state) {
        final currentIp = state.currentIp;

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
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nearby',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      if (currentIp != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          currentIp,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 243, 243, 243),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: state.maybeWhen(
                    active: (currentIp, discoveryHandles) => CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 0.7,
                        height: 250,
                        enableInfiniteScroll: false,
                      ),
                      items: discoveryHandles
                          .map(
                            (discoveryHandle) => CameraDiscoveryItem(
                              discoveryHandle: discoveryHandle,
                            ),
                          )
                          .toList(),
                    ),
                    orElse: () => const Center(
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
