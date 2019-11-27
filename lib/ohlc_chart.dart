import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void OHLCChartCreatedCallback(OHLCChartController controller);

class OHLCChart extends StatefulWidget {
  const OHLCChart({
    Key key,
    this.onOHLCChartCreated,
  }) : super(key: key);

  final OHLCChartCreatedCallback onOHLCChartCreated;

  @override
  State<StatefulWidget> createState() => _OHLCChartState();
}

class _OHLCChartState extends State<OHLCChart> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: AndroidView(
          viewType: 'plugins.com.example/ohlc',
          onPlatformViewCreated: _onPlatformViewCreated,
        ),
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the ohlc_chart plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onOHLCChartCreated == null) {
      return;
    }
    widget.onOHLCChartCreated(new OHLCChartController._(id));
  }
}

class OHLCChartController {
  OHLCChartController._(int id)
      : _channel = new MethodChannel('plugins.com.example/ohlc_$id');

  final MethodChannel _channel;

  Future<void> setText(String text) async {
    assert(text != null);
    return _channel.invokeMethod('setText', text);
  }
}
