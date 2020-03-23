import 'dart:async';

import 'package:flutter/services.dart';

class XlogPlugin {
  static const MethodChannel _channel =
      const MethodChannel('xlog_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static d(String msg, {tag: 'X-LOG'}) {
    _channel.invokeMethod('logD', {'tag': tag, 'msg': msg});
  }

  static w(String msg, {tag: 'X-LOG'}) {
    _channel.invokeMethod('logW', {'tag': tag, 'msg': msg});
  }

  static i(String msg, {tag: 'X-LOG'}) {
    _channel.invokeMethod('logI', {'tag': tag, 'msg': msg});
  }

  static e(String msg, {tag: 'X-LOG'}) {
    _channel.invokeMethod('logE', {'tag': tag, 'msg': msg});
  }

  static json(String msg, {tag: 'X-LOG'}) {
    try {
      _channel.invokeMethod('logJson', {'tag': tag, 'msg': msg});
    } catch (e) {
      d(msg);
    }
  }
}
