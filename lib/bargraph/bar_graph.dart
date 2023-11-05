// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/bargraph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;
  final int? totalSales;
  const MyBarGraph({
    Key? key,
    required this.weeklySummary,
    this.totalSales,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      mobiles: weeklySummary[0],
      essentials: weeklySummary[1],
      appliances: weeklySummary[2],
      books: weeklySummary[3],
      fashion: weeklySummary[4],
    );
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: totalSales?.toDouble(),
        minY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: true),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles:
                SideTitles(showTitles: true, getTitlesWidget: getBottomTitles),
          ),
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Colors.grey[800],
                      width: 25,
                      borderRadius: BorderRadius.circular(1),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 100,
                        color: Colors.grey[200],
                      )),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text(
        'Mobiles',
        style: style,
      );
      break;

    case 2:
      text = const Text(
        'Essential',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'Appliances',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'Books',
        style: style,
      );
      break;

    case 5:
      text = const Text(
        'Fashion',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
