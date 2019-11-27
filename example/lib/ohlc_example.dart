import 'package:flutter/material.dart';
import 'package:flutter_sci_chart_plugin/ohlc_chart.dart';

class OHLCChartExample extends StatefulWidget {

  @override
  _OHLCChartExampleState createState() => _OHLCChartExampleState();

}

class _OHLCChartExampleState extends State<OHLCChartExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sci-Chart OHLC'),),
      body: OHLCChart(
        onOHLCChartCreated: _onOHLCChartCreated,
      ),
    );
  }

  void _onOHLCChartCreated(OHLCChartController controller) {
    controller.setText('Sci');
  }
}
