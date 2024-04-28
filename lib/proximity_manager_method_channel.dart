import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'proximity_manager_platform_interface.dart';

/// An implementation of [ProximityManagerPlatform] that uses method channels.
class MethodChannelProximityManager extends ProximityManagerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ghasemiarani.iman.proximity_manager');

  @override
  Future<void> turnOnProximityManager() async {
    await methodChannel.invokeMethod('turnOnProximityManager');
  }

  @override
  Future<void> turnOffProximityManager() async {
    await methodChannel.invokeMethod('turnOffProximityManager');
  }
}
