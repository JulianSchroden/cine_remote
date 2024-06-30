import 'package:flutter/material.dart';

class EosPtpIpPairingErrorCard extends StatelessWidget {
  const EosPtpIpPairingErrorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Pairing failed',
          style: TextStyle(fontSize: 28),
        ),
        const SizedBox(height: 8),
        const Text(
          'Please put your camera into pairing mode and try again.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ButtonStyle(
              fixedSize: WidgetStateProperty.all(const Size.fromHeight(64))),
          child: const Text(
            'Try again',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
