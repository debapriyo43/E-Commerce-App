import 'package:e_commerce_app/features/auth/screens/auth_Screen.dart';
import 'package:e_commerce_app/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'common/widgets/bottom_bar.dart';

Route<dynamic>genarateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
    return MaterialPageRoute(settings: routeSettings,builder: (_)=>const AuthScreen());
    case HomeScreen.routeName:
    return MaterialPageRoute(settings: routeSettings,builder: (_)=>const HomeScreen());
    case BottomBar.routeName:
    return MaterialPageRoute(settings: routeSettings,builder: (_)=>const BottomBar());
    default:
      return MaterialPageRoute(settings: routeSettings,builder: (_)=>const Scaffold(body: Text('Something is going wrong'),));
  }
}