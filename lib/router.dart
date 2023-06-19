import 'package:e_commerce_app/features/auth/screens/auth_Screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>genarateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
    return MaterialPageRoute(builder: (_)=>const AuthScreen());
    default:
      return MaterialPageRoute(builder: (_)=>const Scaffold(body: Text('Something is going wrong'),));
  }
}