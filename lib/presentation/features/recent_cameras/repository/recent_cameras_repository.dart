import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../camera_control/interface/models/camera_handle.dart';
import '../../../../camera_control/interface/models/pairing_data.dart';
import 'recent_camera.dart';

class HiveAdapter {
  const HiveAdapter();

  Future<void> init() async {
    final supportDir = await getApplicationSupportDirectory();
    Hive.init(supportDir.path);
  }

  Future<Box<E>> openBox<E>(String name) => Hive.openBox(name);
}

class RecentCamerasRepostitory {
  static const boxName = 'recent_cameras';
  Box? _recentCamerasBox;

  final HiveAdapter _hiveAdapter;

  RecentCamerasRepostitory(this._hiveAdapter);

  Future<void> _ensureBoxIsOpen() async {
    _recentCamerasBox ??= await _hiveAdapter.openBox(boxName);
  }

  Future<List<RecentCamera>> getAllRecentCameras() async {
    await _ensureBoxIsOpen();

    return _recentCamerasBox!.values
        .map((encodedEntry) => RecentCamera.fromJson(jsonDecode(encodedEntry)))
        .toList();
  }

  Future<void> addCamera(CameraHandle handle) async {
    await _ensureBoxIsOpen();

    final recentCamera = handle.toRecentCamera();

    await _recentCamerasBox!.put(
      recentCamera.id,
      jsonEncode(
        handle.toRecentCamera().toJson(),
      ),
    );
  }

  Future<PairingData?> getPairingData(String id) async {
    await _ensureBoxIsOpen();

    final encodedEntry = _recentCamerasBox!.get(id);
    if (encodedEntry == null) return null;
    return RecentCamera.fromJson(jsonDecode(encodedEntry)).pairingData;
  }
}
