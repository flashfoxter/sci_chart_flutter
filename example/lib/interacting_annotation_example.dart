import 'package:flutter/material.dart';
import 'package:flutter_sci_chart_plugin/interacting_annotation_chart.dart';

class InteractingAnnotationChartExample extends StatefulWidget {
  @override
  _InteractingAnnotationChartExampleState createState() => _InteractingAnnotationChartExampleState();
}

class _InteractingAnnotationChartExampleState extends State<InteractingAnnotationChartExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sci-Chart CandleStick'),),
      body: InteractingAnnotationChart(
        onInteractingAnnotationChartCreated: _onInteractingAnnotationChartCreated,
      ),
    );
  }

  void _onInteractingAnnotationChartCreated(InteractingAnnotationChartController controller) {
    //controller.setText('Sci');
  }
}

