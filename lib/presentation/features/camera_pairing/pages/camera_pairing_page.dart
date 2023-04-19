import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/eos_ptp_ip/discovery/eos_ptp_ip_discovery_handle.dart';
import '../../../core/widgets/laoding_overlay_layout.dart';
import '../bloc/camera_pairing_cubit.dart';
import '../widgets/eos_ptp_ip_pairing_card.dart';

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
        if (discoverHandle is! EosPtpIpDiscoveryHandle) {
          return Container();
        }

        return EosPtpIpPairingCard(discoveryHandle: discoverHandle);
      },
      orElse: () => const Center(
        child: Text('orElse'),
      ),
    );
  }
}
