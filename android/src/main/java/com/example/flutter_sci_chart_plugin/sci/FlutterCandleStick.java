package com.example.flutter_sci_chart_plugin.sci;

import android.content.Context;
import android.util.Log;
import android.view.View;

import com.example.flutter_sci_chart_plugin.RealTimeOhlcChart;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

import static io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import static io.flutter.plugin.common.MethodChannel.Result;

public class FlutterCandleStick implements PlatformView, MethodCallHandler  {
    private final MethodChannel methodChannel;
    RealTimeOhlcChart realTimeOhlcChart;

    FlutterCandleStick(Context context, BinaryMessenger messenger, int id) {
        methodChannel = new MethodChannel(messenger, "plugins.com.example/candlestick_" + id);
        methodChannel.setMethodCallHandler(this);
        realTimeOhlcChart = new RealTimeOhlcChart(context, false);
        Log.i("TAG2", "inited RealTimeOhlcChart: " + realTimeOhlcChart);
        realTimeOhlcChart.startRealTimeChart();
    }

    @Override
    public View getView() {
        Log.i("TAG2", "get surface: " + realTimeOhlcChart);
        return realTimeOhlcChart.getChartLayout();
    }

    @Override
    public void onMethodCall(MethodCall methodCall, Result result) {
        switch (methodCall.method) {
            case "setText":
                setText(methodCall, result);
                break;
            default:
                result.notImplemented();
        }

    }

    private void setText(MethodCall methodCall, Result result) {
        String text = (String) methodCall.arguments;
        result.success(null);
    }

    @Override
    public void dispose() {}

}
