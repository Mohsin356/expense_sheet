import 'package:flutter/material.dart';
class TextFields extends StatelessWidget {
   const TextFields({Key? key,required this.lblText,required this.lblTxtClr,
     required this.borderColor,required this.cursorColor,required this.controller,this.inputType,this.dataSubmit}) : super(key: key);
  final String lblText;
  final Color lblTxtClr;
  final Color borderColor;
  final Color cursorColor;
  final TextEditingController controller;
  final TextInputType? inputType;
  final Function? dataSubmit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      onSubmitted: (_)=>dataSubmit,
      decoration: InputDecoration(labelText: lblText,labelStyle: TextStyle(
      color: lblTxtClr,
    ), focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor),
    ), enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color:borderColor,)
    ),),cursorColor: cursorColor,);
  }
}
