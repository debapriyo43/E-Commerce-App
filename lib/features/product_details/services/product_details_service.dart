
import 'dart:convert';

import 'package:e_commerce_app/constants/error_handling.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../models/product.dart';
import '../../../providers/user_provider.dart';
import 'package:http/http.dart'as http;
class ProductDetailsServices{
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  })async{
    final userProvider = Provider.of<UserProvider>(context,listen:false);
    try{

      http.Response res= await http.post(Uri.parse('$uri/admin/rate-product'),
      headers: {
        'Content-Type':'application/json;charset=UTF-8',
        'x-auth-token':userProvider.user.token,
      },
      body:jsonEncode({
        'id':product.id!,
        'rating':rating,
    }),
      );
      httpErrorHandle(response: res, context: context, onSuccess: (){});
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
}