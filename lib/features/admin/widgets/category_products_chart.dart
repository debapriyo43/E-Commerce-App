// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/bargraph/bar_graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/features/admin/models/sales.dart';

class CategoryProductsChart extends StatelessWidget {
  CategoryProductsChart({
    Key? key,
  }) : super(key: key);
  List<double> weeklySummary = [
    4.40,
    2.50,
    38.75,
    75.38,
    78,
    99,
    40,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
              height: 300,
              child: MyBarGraph(
                weeklySummary: weeklySummary,
              ))),
    );
  }
}
