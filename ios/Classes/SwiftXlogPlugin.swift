import Flutter
import UIKit
import CocoaLumberjack

public class SwiftXlogPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "xlog_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftXlogPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    //result("iOS " + UIDevice.current.systemVersion)
    let args = call.arguments as! [String: Any];
    switch call.method {
        case "getPlatformVersion":
        case "logD":
        case "logW":
        case "logI":
        case "logE":
        case "logJson":
        default:
            result(FlutterMethodNotImplemented)
    }
  }
}
