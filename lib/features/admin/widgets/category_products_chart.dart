// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_app/bargraph/bar_graph.dart';
import 'package:e_commerce_app/features/admin/models/sales.dart';

class CategoryProductsChart extends StatefulWidget {
  final List<Sales>? sales;
  final int? totalSales;
  const CategoryProductsChart({
    Key? key,
    required this.sales,
    required this.totalSales,
  }) : super(key: key);

  @override
  State<CategoryProductsChart> createState() => _CategoryProductsChartState();
}

class _CategoryProductsChartState extends State<CategoryProductsChart> {
  List<double> weeklySummary = [];
  @override
  Widget build(BuildContext context) {
    debugPrint('${widget.totalSales}');
    for (int i = 0; i < widget.sales!.length; i++) {
      weeklySummary.add(widget.sales![i].earning + 0.0);
      debugPrint(
          "Label: ${widget.sales![i].label}, Earning: ${widget.sales![i].earning}");
    }
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Total Sales: ${widget.totalSales}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 400,
              width: 400,
              child: MyBarGraph(
                weeklySummary: weeklySummary,
                totalSales: widget.totalSales,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
