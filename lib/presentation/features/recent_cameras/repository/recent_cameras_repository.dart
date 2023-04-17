import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../camera_control/interface/models/camera_handle.dart';
import '../../../../camera_control/interface/models/pairing_data.dart';
import '../../../core/adapter/date_time_adapter.dart';
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
  StreamController<RecentCamera>? _onCameraAdded;

  final HiveAdapter _hiveAdapter;
  final DateTimeAdapter _dateTimeAdapter;

  RecentCamerasRepostitory(this._hiveAdapter, this._dateTimeAdapter);

  Future<void> _ensureBoxIsOpen() async {
    _recentCamerasBox ??= await _hiveAdapter.openBox(boxName);
  }

  Future<void> close() async {
    await _recentCamerasBox?.close();
    await _onCameraAdded?.close();
  }

  Stream<RecentCamera> get onCameraAdded {
    _onCameraAdded ??= StreamController<RecentCamera>.broadcast();

    return _onCameraAdded!.stream;
  }

  Future<List<RecentCamera>> getAllRecentCameras() async {
    await _ensureBoxIsOpen();

    return _recentCamerasBox!.values
        .map((encodedEntry) => RecentCamera.fromJson(jsonDecode(encodedEntry)))
        .toList()
      ..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));
  }

  Future<void> addCamera(CameraHandle handle) async {
    await _ensureBoxIsOpen();

    final recentCamera = handle.toRecentCamera(_dateTimeAdapter.now());

    await _recentCamerasBox!.put(
      recentCamera.id,
      jsonEncode(
        recentCamera.toJson(),
      ),
    );

    _onCameraAdded?.add(recentCamera);
  }

  Future<PairingData?> getPairingData(String id) async {
    await _ensureBoxIsOpen();

    final encodedEntry = _recentCamerasBox!.get(id);
    if (encodedEntry == null) return null;
    return RecentCamera.fromJson(jsonDecode(encodedEntry)).pairingData;
  }
}
