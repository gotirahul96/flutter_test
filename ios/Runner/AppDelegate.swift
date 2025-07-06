import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    self.registerPlugins(self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func registerPlugins(_ registry: FlutterPluginRegistry) {
    if let registrar = registry.registrar(forPlugin: "battery") {
      let batteryChannel = FlutterMethodChannel(
        name: "samples.flutter.dev/battery",
        binaryMessenger: registrar.messenger()
      )
      batteryChannel.setMethodCallHandler { [weak self] call, result in
        guard call.method == "getBatteryLevel" else {
          result(FlutterMethodNotImplemented)
          return
        }
        self?.receiveBatteryLevel(result: result)
      }
    }
  }

  private func receiveBatteryLevel(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if device.batteryState == .unknown {
      result(FlutterError(code: "UNAVAILABLE",
                          message: "Battery level not available.",
                          details: nil))
    } else {
      result(Int(device.batteryLevel * 100))
    }
  }
}
