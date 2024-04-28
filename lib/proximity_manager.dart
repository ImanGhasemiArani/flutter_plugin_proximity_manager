import 'proximity_manager_platform_interface.dart';

class ProximityManager {
  ProximityManager._();

  static Future<void> toggleProximityManager(bool active) {
    if (active) {
      return ProximityManagerPlatform.instance.turnOnProximityManager();
    } else {
      return ProximityManagerPlatform.instance.turnOffProximityManager();
    }
  }
}
