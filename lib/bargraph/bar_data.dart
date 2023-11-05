import 'package:e_commerce_app/bargraph/individual_bar.dart';

class BarData {
  final double mobiles;
  final double essentials;
  final double appliances;
  final double books;
  final double fashion;

  BarData({
    required this.mobiles,
    required this.essentials,
    required this.appliances,
    required this.books,
    required this.fashion,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 1, y: mobiles),
      IndividualBar(x: 2, y: essentials),
      IndividualBar(x: 3, y: appliances),
      IndividualBar(x: 4, y: books),
      IndividualBar(x: 5, y: fashion),
    ];
  }
}
