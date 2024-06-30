import 'dart:math';
import 'dart:typed_data';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/camera_pairing_cubit.dart';

class EosPtpIpGuid {
  // TODO: move to camera control
  final Uint8List guid = Uint8List(16);

  EosPtpIpGuid() {
    refresh();
    Uint8List.fromList(List.generate(16, (index) => index));
  }

  void refresh() {
    final seed = DateTime.now().millisecondsSinceEpoch;
    final random = Random(seed);
    for (var i = 0; i < guid.length; i++) {
      guid[i] = random.nextInt(255);
    }
  }

  Uint8List get value => guid;

  @override
  String toString() {
    return guid
        .map((e) => e.toRadixString(16).padLeft(2, '0'))
        .join('')
        .toUpperCase();
  }
}

class EosPtpIpPairingCard extends StatefulWidget {
  final EosPtpIpDiscoveryHandle discoveryHandle;

  const EosPtpIpPairingCard({
    required this.discoveryHandle,
    super.key,
  });

  @override
  State<EosPtpIpPairingCard> createState() => _EosPtpIpPairingCardState();
}

class _EosPtpIpPairingCardState extends State<EosPtpIpPairingCard> {
  final EosPtpIpGuid pairingGuid = EosPtpIpGuid();
  final TextEditingController pairingGuidController = TextEditingController();
  final TextEditingController ipAddressController = TextEditingController();
  final TextEditingController clientNameController = TextEditingController();

  @override
  void initState() {
    refreshGuid();
    ipAddressController.text = widget.discoveryHandle.address;
    super.initState();
  }

  void refreshGuid() {
    pairingGuid.refresh();
    pairingGuidController.text = pairingGuid.toString();
  }

  void initiatePairing() {
    print(
        'connect to: ${ipAddressController.text} with clientName: ${clientNameController.text} and guid: ${pairingGuidController.text}');

    final cameraHandle = CameraConnectionHandle(
      id: widget.discoveryHandle.id,
      model: widget.discoveryHandle.model,
      pairingData: EosPtpIpCameraPairingData(
        address: widget.discoveryHandle.address,
        guid: pairingGuid.value,
        clientName: clientNameController.text,
      ),
    );

    context.read<CameraPairingCubit>().pair(cameraHandle);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Pair with',
          style: TextStyle(color: Colors.grey[300]),
        ),
        const SizedBox(height: 6),
        Text(
          widget.discoveryHandle.model.name,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 48),
        Stack(
          alignment: Alignment.center,
          children: [
            TextFormField(
              controller: pairingGuidController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Guid',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () => refreshGuid(),
                icon: const Icon(Icons.refresh),
              ),
            )
          ],
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: ipAddressController,
          decoration: const InputDecoration(
            labelText: 'Ip Address',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: clientNameController,
          decoration: const InputDecoration(
            labelText: 'Client Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: initiatePairing,
          style: ButtonStyle(
              fixedSize: WidgetStateProperty.all(const Size.fromHeight(64))),
          child: const Text(
            'Initiate Paring',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
