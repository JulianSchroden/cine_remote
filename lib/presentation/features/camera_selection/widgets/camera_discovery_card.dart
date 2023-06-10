import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/interface/discovery/discovery_handle.dart';
import '../bloc/camera_discovery_cubit.dart';
import 'camera_discovery_item.dart';
import 'camera_discovery_card_header.dart';

class CameraDisoveryCard extends StatelessWidget {
  final EdgeInsets padding;
  final BoxConstraints constraints;
  final bool respectsRightSafeArea;
  final bool respectBottomSafeArea;

  const CameraDisoveryCard({
    required this.padding,
    required this.constraints,
    required this.respectsRightSafeArea,
    required this.respectBottomSafeArea,
    super.key,
  });

  const CameraDisoveryCard.portrait({super.key})
      : padding = const EdgeInsets.all(0),
        constraints = const BoxConstraints(maxHeight: 400),
        respectsRightSafeArea = true,
        respectBottomSafeArea = false;

  const CameraDisoveryCard.landscape({super.key})
      : padding = const EdgeInsets.only(right: 16),
        constraints = const BoxConstraints(maxWidth: 350),
        respectsRightSafeArea = false,
        respectBottomSafeArea = true;

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
          constraints: constraints,
          child: SafeArea(
            bottom: respectBottomSafeArea,
            right: respectsRightSafeArea,
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CameraDiscoveryCardHeader(
                    title: 'Nearby',
                    subTitle: currentIp,
                    isDiscovering: state.isActive,
                  ),
                  Expanded(
                    child: state.maybeWhen(
                      initInProgress: () => _buildLoadingSpinner(context),
                      active: (_, discoveryHandles) =>
                          discoveryHandles.isNotEmpty
                              ? _buildCarousel(context, discoveryHandles)
                              : _buildLoadingSpinner(context),
                      paused: (_) => const SizedBox.shrink(),
                      orElse: () => _buildLoadingSpinner(context),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCarousel(
    BuildContext context,
    List<DiscoveryHandle> discoveryHandles,
  ) =>
      CarouselSlider(
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
      );

  Widget _buildLoadingSpinner(BuildContext context) => const Center(
        child: SizedBox(
          width: 48,
          height: 48,
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
}
