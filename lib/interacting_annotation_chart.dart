import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void InteractingAnnotationChartCreatedCallback(InteractingAnnotationChartController controller);

class InteractingAnnotationChart extends StatefulWidget {
  const InteractingAnnotationChart({
    Key key,
    this.onInteractingAnnotationChartCreated,
  }) : super(key: key);

  final InteractingAnnotationChartCreatedCallback onInteractingAnnotationChartCreated;

  @override
  State<StatefulWidget> createState() => _InteractingAnnotationChartState();
}

class _InteractingAnnotationChartState extends State<InteractingAnnotationChart> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: AndroidView(
          viewType: 'plugins.com.example/interacting_annotation',
          onPlatformViewCreated: _onPlatformViewCreated,
        ),
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the interacting plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onInteractingAnnotationChartCreated == null) {
      return;
    }
    widget.onInteractingAnnotationChartCreated(new InteractingAnnotationChartController._(id));
  }
}

class InteractingAnnotationChartController {
  InteractingAnnotationChartController._(int id)
      : _channel = new MethodChannel('plugins.com.example/interacting_annotation_$id');

  final MethodChannel _channel;

  Future<void> setText(String text) async {
    assert(text != null);
    return _channel.invokeMethod('setText', text);
  }
}
