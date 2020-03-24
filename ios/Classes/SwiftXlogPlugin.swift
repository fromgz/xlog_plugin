import Flutter
import UIKit
import CocoaLumberjack

public class SwiftXlogPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "xlog_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftXlogPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    DDLog.add(DDTTYLogger.sharedInstance!)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    //result("iOS " + UIDevice.current.systemVersion)
    let args = call.arguments as? Dictionary<String, String>
    
    switch call.method {
    case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion);
        break;
    case "logD": DDLogDebug(args?["msg"] ?? ""); break;
    case "logW": DDLogWarn(args?["msg"] ?? ""); break;
    case "logI": DDLogInfo(args?["msg"] ?? ""); break;
    case "logE": DDLogError(args?["msg"] ?? ""); break;
    case "logJson": DDLogDebug(args?["msg"] ?? ""); break;
        default:
            result(FlutterMethodNotImplemented)
    }
  }
}
