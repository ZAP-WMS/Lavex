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
  final List<PricePoint> points = [
    PricePoint(1000, 500),
    PricePoint(2000, 1000),
    PricePoint(3000, 2000),
    PricePoint(4000, 3000),
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: BarChart(
            BarChartData(
              barGroups: _chartGroups(),
              borderData: FlBorderData(
                  border: const Border(
                      bottom: BorderSide(width: 1.0), left: BorderSide())),
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(reservedSize: 40, showTitles: true)),
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
