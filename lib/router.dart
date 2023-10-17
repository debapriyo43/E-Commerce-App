import 'package:e_commerce_app/features/address/screens/address_screen.dart';
import 'package:e_commerce_app/features/admin/screens/add_product_screen.dart';
import 'package:e_commerce_app/features/auth/screens/auth_Screen.dart';
import 'package:e_commerce_app/features/home/screens/category_deals_screen.dart';
import 'package:e_commerce_app/features/home/screens/home_screen.dart';
import 'package:e_commerce_app/features/order_details/screens/order_details.dart';
import 'package:e_commerce_app/features/product_details/screens/product_details_screen.dart';
import 'package:e_commerce_app/features/search/screens/search_screen.dart';
import 'package:e_commerce_app/models/order.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

import 'common/widgets/bottom_bar.dart';

Route<dynamic> genarateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProductScreen());
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryDealsScreen(
                category: category,
              ));
    case SearchScreen.routeName:
      var searchQueary = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchScreen(
                searchQueary: searchQueary,
              ));
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProductDetailScreen(
                product: product,
              ));
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => AddressScreen(
                totalAmount: totalAmount,
              ));
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => OrderDetailScreen(
                order: order,
              ));
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Text('Something is going wrong'),
              ));
  }
}
