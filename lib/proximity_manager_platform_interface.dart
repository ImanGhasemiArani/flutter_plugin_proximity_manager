import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'proximity_manager_method_channel.dart';

abstract class ProximityManagerPlatform extends PlatformInterface {
  /// Constructs a ProximityManagerPlatform.
  ProximityManagerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ProximityManagerPlatform _instance = MethodChannelProximityManager();

  /// The default instance of [ProximityManagerPlatform] to use.
  ///
  /// Defaults to [MethodChannelProximityManager].
  static ProximityManagerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ProximityManagerPlatform] when
  /// they register themselves.
  static set instance(ProximityManagerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> turnOnProximityManager() async {
    throw UnimplementedError(
        'turnOnProximityManager() has not been implemented.');
  }

  Future<void> turnOffProximityManager() async {
    throw UnimplementedError(
        'turnOffProximityManager() has not been implemented.');
  }
}
