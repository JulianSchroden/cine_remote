import 'package:flutter/material.dart';

import '../widgets/camera_selection_item.dart';

class CameraSelectionPage extends StatelessWidget {
  const CameraSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CameraSelectionItem(
                modelName: 'Canon C100 II',
                modelImageSource:
                    'https://www.canon.de/media/EOS%20C100%20Mark%20II%20Default_tcm83-1211141.jpg',
              ),
              TextButton(onPressed: () {}, child: Text('Connect'))
            ],
          ),
        ),
      ),
    );
  }
}
