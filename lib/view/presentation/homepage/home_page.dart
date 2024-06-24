import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lavex/widgets/custom_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  int _selectedValue = 0; // Default selected value

  final List<String> _options = [
    'Company wise Chart',
    'Purchase Wise Chart',
    'Payment Chart',
    'SalesMan Chart',
    'Branch sale chart',
    'Top client',
    'Top Products Sale'
  ];
  final List<PricePoint> points = [
    PricePoint(1000, 500),
    PricePoint(2000, 1000),
    PricePoint(3000, 2000),
    PricePoint(4000, 3000),
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      pageName: 'Home Page',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _options.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 180,
                      child: RadioListTile<int>(
                        title: Text(_options[index]),
                        value: index,
                        groupValue: _selectedValue,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedValue = value!;
                          });
                        },
                      ),
                    );
                  }),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.height * 0.8,
              child: AspectRatio(
                aspectRatio: 1,
                child: BarChart(
                  BarChartData(
                    barGroups: _chartGroups(),
                    borderData: FlBorderData(
                        border: const Border(
                            bottom: BorderSide(width: 1.0),
                            left: BorderSide())),
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                      leftTitles: AxisTitles(
                          sideTitles:
                              SideTitles(reservedSize: 40, showTitles: true)),
                      topTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                      )),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return points
        .map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [
              BarChartRodData(
                  width: 50,
                  toY: point.y,
                  borderRadius: BorderRadius.circular(0)),
            ]))
        .toList();
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1000:
              text = 'invoice';
              break;
            case 2000:
              text = 'pro-forma';
              break;
            case 3000:
              text = 'debit-note';
              break;
            case 4000:
              text = 'credit-note';
              break;
          }

          return Text(text);
        },
      );
}

class PricePoint {
  final double x;
  final double y;

  PricePoint(this.x, this.y);
}
