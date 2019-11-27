import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void CandleStickChartCreatedCallback(CandleStickChartController controller);

class CandleStickChart extends StatefulWidget {
  const CandleStickChart({
    Key key,
    this.onCandleStickChartCreated,
  }) : super(key: key);

  final CandleStickChartCreatedCallback onCandleStickChartCreated;

  @override
  State<StatefulWidget> createState() => _CandleStickChartState();
}

class _CandleStickChartState extends State<CandleStickChart> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: AndroidView(
          viewType: 'plugins.com.example/candlestick',
          onPlatformViewCreated: _onPlatformViewCreated,
        ),
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the candlestick plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onCandleStickChartCreated == null) {
      return;
    }
    widget.onCandleStickChartCreated(new CandleStickChartController._(id));
  }
}

class CandleStickChartController {
  CandleStickChartController._(int id)
      : _channel = new MethodChannel('plugins.com.example/candlestick_$id');

  final MethodChannel _channel;

  Future<void> setText(String text) async {
    assert(text != null);
    return _channel.invokeMethod('setText', text);
  }
}
