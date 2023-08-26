import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/laoding_overlay_layout.dart';
import '../bloc/camera_pairing_cubit.dart';
import '../widgets/eos_ptp_ip_pairing_card.dart';
import '../widgets/eos_ptp_ip_pairing_error_card.dart';

class CameraPairingPage extends StatelessWidget {
  const CameraPairingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraPairingCubit, CameraPairingState>(
      listener: (context, state) {
        state.maybeWhen(
            success: (handle) => Navigator.of(context).pop(), orElse: () {});
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: LoadingOverlayLayout(
            backgroundColor: const Color.fromARGB(200, 0, 0, 0),
            showOverlay:
                state.maybeWhen(inProgress: (_) => true, orElse: () => false),
            overlayMessage: 'Pairing with camera ...',
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 32,
                ),
                child: buildPairingCard(state),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPairingCard(CameraPairingState state) {
    return state.maybeWhen(
      active: (discoverHandle) {
        if (discoverHandle is EosPtpIpDiscoveryHandle) {
          return EosPtpIpPairingCard(discoveryHandle: discoverHandle);
        }

        return const SizedBox.shrink();
      },
      error: () => const EosPtpIpPairingErrorCard(),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
