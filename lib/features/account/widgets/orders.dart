import 'package:e_commerce_app/constants/global_variables.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //temporary list
  List list = [
    'https://unsplash.com/photos/a-group-of-pink-and-white-leaves-floating-in-the-air--widB6iivrw',
    'https://unsplash.com/photos/a-group-of-pink-and-white-leaves-floating-in-the-air--widB6iivrw',
    'https://unsplash.com/photos/a-group-of-pink-and-white-leaves-floating-in-the-air--widB6iivrw',
    'https://unsplash.com/photos/a-group-of-pink-and-white-leaves-floating-in-the-air--widB6iivrw',
    'https://unsplash.com/photos/a-group-of-pink-and-white-leaves-floating-in-the-air--widB6iivrw',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left:15,),
              child: const Text(
                'Your Orders',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right:15,),
              child: Text(
                'See all',style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),
          ],
        ),
        //Display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(left:10,top:20,right:0),
          child:ListView.builder(itemCount: list.length,itemBuilder: (context,index){

          })
        )
      ],
    );
  }
}