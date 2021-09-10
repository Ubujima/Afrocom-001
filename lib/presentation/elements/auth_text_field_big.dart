import 'package:flutter/material.dart';
import 'package:newuiproject/configuration/front_end_configs.dart';

class AuthTextFieldBig extends StatelessWidget {
  final String label;

  AuthTextFieldBig({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: TextFormField(
        maxLines: 4,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
            color: Color(0xff7A7878),
              fontWeight: FontWeight.w400,
              fontSize: 16,),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),),
        ),
      ),
    );
  }
}
