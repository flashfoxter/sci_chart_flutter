package com.example.flutter_sci_chart_plugin;

import com.example.flutter_sci_chart_plugin.sci.CandleStickFactory;
import com.example.flutter_sci_chart_plugin.sci.OHLCFactory;
import com.scichart.charting.visuals.SciChartSurface;

import io.flutter.Log;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterSciChartPlugin */
public class FlutterSciChartPlugin {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {

    setLicense();

    registrar
            .platformViewRegistry()
            .registerViewFactory(
                    "plugins.com.example/ohlc", new OHLCFactory(registrar.messenger()));

    registrar
            .platformViewRegistry()
            .registerViewFactory(
                    "plugins.com.example/candlestick", new CandleStickFactory(registrar.messenger()));
  }

  private static void setLicense() {
    try {
      SciChartSurface.setRuntimeLicenseKey("Your license");
    } catch (Exception e) {
      Log.e("SciChart", "Error when setting the license", e);
    }
  }
}
