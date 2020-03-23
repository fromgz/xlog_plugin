#import "XlogPlugin.h"
#import <xlog_plugin/xlog_plugin-Swift.h>

@implementation XlogPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftXlogPlugin registerWithRegistrar:registrar];
}
@end
