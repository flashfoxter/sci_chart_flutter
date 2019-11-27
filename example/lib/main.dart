import 'package:flutter/material.dart';

import 'candlestick_example.dart';
import 'ohlc_example.dart';



void main() => runApp(MaterialApp(home: ChartExample()));

class ChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sci-Chart in Flutter')),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Real time OHLC Chart'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context){
                    return OHLCChartExample();
                  }
                ));
              },
            ),

            ListTile(
              title: Text('Real time CandleStick Chart'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return CandleStickChartExample();
                    }
                ));
              },
            ),
          ],
        )
    );
  }


}
