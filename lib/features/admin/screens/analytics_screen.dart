import 'package:e_commerce_app/common/widgets/loader.dart';
import 'package:e_commerce_app/features/admin/models/sales.dart';
import 'package:e_commerce_app/features/admin/services/admin_services.dart';
import 'package:e_commerce_app/features/admin/widgets/category_products_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;
  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    debugPrint('$totalSales');
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Scaffold(
            body: CategoryProductsChart(
              sales: earnings,
              totalSales: totalSales,
            ),
          );
  }
}
