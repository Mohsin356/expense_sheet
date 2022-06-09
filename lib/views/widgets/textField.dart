import 'package:flutter/material.dart';
class TextFields extends StatelessWidget {
   const TextFields({Key? key,required this.lblText,required this.lblTxtClr,
     required this.borderColor,required this.cursorColor,required this.controller}) : super(key: key);
  final String lblText;
  final Color lblTxtClr;
  final Color borderColor;
  final Color cursorColor;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: lblText,labelStyle: TextStyle(
      color: lblTxtClr,
    ), focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor),
    ), enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color:borderColor,)
    ),),cursorColor: cursorColor,);
  }
}
