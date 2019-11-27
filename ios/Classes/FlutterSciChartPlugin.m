#import "FlutterSciChartPlugin.h"
#import <flutter_sci_chart_plugin/flutter_sci_chart_plugin-Swift.h>

@implementation FlutterSciChartPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSciChartPlugin registerWithRegistrar:registrar];
}
@end
