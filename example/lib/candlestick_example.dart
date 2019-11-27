import 'package:flutter/material.dart';
import 'package:flutter_sci_chart_plugin/candlestick_chart.dart';

class CandleStickChartExample extends StatefulWidget {
  @override
  _CandleStickChartExampleState createState() => _CandleStickChartExampleState();
}

class _CandleStickChartExampleState extends State<CandleStickChartExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sci-Chart CandleStick'),),
      body: CandleStickChart(
        onCandleStickChartCreated: _onCandleStickChartCreated,
      ),
    );
  }

  void _onCandleStickChartCreated(CandleStickChartController controller) {
    controller.setText('Sci');
  }
}

