import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ,
      decoration: InputDecoration(border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black38),
      ),
      enabledBorder:const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black38),
      )),
    );
  }
}