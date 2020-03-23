package com.example.xlog_plugin

import com.elvishew.xlog.LogConfiguration
import com.elvishew.xlog.LogLevel
import com.elvishew.xlog.XLog
import io.flutter.BuildConfig
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar


class XlogPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      // 指定日志级别，低于该级别的日志将不会被打印，默认为 LogLevel.ALL
      val config: LogConfiguration = LogConfiguration.Builder()
              .logLevel(if (BuildConfig.DEBUG) LogLevel.ALL else LogLevel.NONE).build()

      XLog.init(config)

      val channel = MethodChannel(registrar.messenger(), "xlog_plugin")
      channel.setMethodCallHandler(XlogPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    val tag: String? = call.argument("tag")
    val message: String? = call.argument("msg")

    when (call.method) {
      "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
      "logD" -> XLog.tag(tag).d(message)
      "logW" -> XLog.tag(tag).w(message)
      "logI" -> XLog.tag(tag).i(message)
      "logE" -> XLog.tag(tag).e(message)
      "logJson" -> XLog.tag(tag).json(message)
      else -> result.notImplemented()
    }
  }
}
