package ghasemiarani.iman.proximity_manager

import android.content.Context
import android.os.Build
import android.os.PowerManager

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ProximityManagerPlugin */
class ProximityManagerPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    private var wakeLock: PowerManager.WakeLock? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(
            flutterPluginBinding.binaryMessenger, "ghasemiarani.iman.proximity_manager"
        )
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) =
        channel.setMethodCallHandler(null)

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }

            "turnOnProximityManager" -> {
                turnOnProximityManager()
            }

            "turnOffProximityManager" -> {
                turnOffProximityManager()
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    private fun turnOffProximityManager() = wakeLock?.release()

    private fun turnOnProximityManager() {
        val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            wakeLock = powerManager.newWakeLock(
                PowerManager.PROXIMITY_SCREEN_OFF_WAKE_LOCK, "ScreenUtilPlugin:ScreenOff"
            )
        }
        wakeLock?.acquire()
    }
}
