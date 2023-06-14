// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:io';

final allowedFlavors = ['debug', 'prod'];

Future<void> copyFlavorFile(
  String flavor,
  String fileName,
  String relativeDestinationPath,
) async {
  final path = './config/$flavor/$fileName';
  await File(path).copy('$relativeDestinationPath$fileName');
}

void main(List<String> args) async {
  final flavor = args[0];
  if (!allowedFlavors.contains(flavor)) {
    print('flavor `$flavor` is not supported');
    return;
  }

  await copyFlavorFile(flavor, 'firebase_app_id_file.json', './ios/');
  await copyFlavorFile(flavor, 'GoogleService-Info.plist', './ios/Runner/');
  await copyFlavorFile(flavor, 'google-services.json', './android/app/');
  await copyFlavorFile(flavor, 'firebase_options.dart', './lib/');
}
