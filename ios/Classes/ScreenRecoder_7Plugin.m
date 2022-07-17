#import "ScreenRecoder_7Plugin.h"
#if __has_include(<screen_recoder_7/screen_recoder_7-Swift.h>)
#import <screen_recoder_7/screen_recoder_7-Swift.h>
#else
#import "screen_recoder_7-Swift.h"
#endif

@implementation ScreenRecoder_7Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftScreenRecoder_7Plugin registerWithRegistrar:registrar];
}
@end