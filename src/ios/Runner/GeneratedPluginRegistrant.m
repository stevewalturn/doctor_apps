//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<file_picker/FilePickerPlugin.h>)
#import <file_picker/FilePickerPlugin.h>
#else
@import file_picker;
#endif

#if __has_include(<url_launcher_ios/URLLauncherPlugin.h>)
#import <url_launcher_ios/URLLauncherPlugin.h>
#else
@import url_launcher_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FilePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FilePickerPlugin"]];
  [URLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"URLLauncherPlugin"]];
}

@end
