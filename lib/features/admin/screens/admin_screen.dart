import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/images/shopnex.png'),
              width: 120,
              height: 30,
              // color: Colors.black,
            ),
            const Text('Admin',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)

          ]),
        ),
      ),
    );
  }
}