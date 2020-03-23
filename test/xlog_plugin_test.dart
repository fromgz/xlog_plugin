import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xlog_plugin/xlog_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('xlog_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await XlogPlugin.platformVersion, '42');
  });
}
