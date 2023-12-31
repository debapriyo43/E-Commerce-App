import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      address: '',
      email: '',
      name: '',
      token: '',
      id: '',
      password: '',
      type: '',
      cart:[],
      );
      User get user=>_user;
      void setUser(String user){
        _user= User.fromJson(user);
        notifyListeners();
      }

      void setUserFromModel(User user){
        _user=user;
        notifyListeners();
      }

}
