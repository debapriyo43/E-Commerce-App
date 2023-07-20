// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String hintText;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.maxLines=1,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText,border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black38),
      ),
      enabledBorder:OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black38),
      ),),
      validator: (val){
        if(val==null || val.isEmpty){
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
