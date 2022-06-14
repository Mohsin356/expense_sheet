import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DateFormFieldContainer extends StatelessWidget {
  const DateFormFieldContainer(
      {Key? key,
        required  this.isRounded,
        required this.mode,
        required this.dateFormatTrue,
        required this.onDateSelected,
        this.initialValue,
        this.enable = true,
        required  this.isTrue,
        this.dateFormat,
        required this.text,})
      : super(key: key);
  final DateTimeFieldPickerMode mode;
  final bool dateFormatTrue;
  final Function(dynamic) onDateSelected;
  final dynamic dateFormat;
  final dynamic initialValue;
  final bool isRounded;
  final bool enable;
  final String text;
  final bool isTrue;

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      enabled: enable,
      decoration: InputDecoration(fillColor: Colors.white,filled: true,alignLabelWithHint: false,
        hintStyle: const TextStyle(color: Colors.black,),
        errorStyle: const TextStyle(color: Colors.redAccent),

        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: isRounded ? 0.1 : 0, color: Colors.black),
          borderRadius: BorderRadius.circular(
            isRounded ? 8 : 0,
          ),
        ),

        hintText: text,
        contentPadding: const EdgeInsets.all(8),
        // suffixIcon: isTrue? (const Calender()):const SizedBox(),

      ),
      mode: DateTimeFieldPickerMode.date,
      // initialValue: initialValue,
      dateFormat: dateFormatTrue ? DateFormat('dd/MM/yyyy') : null,
      autovalidateMode: AutovalidateMode.always,

      onDateSelected: (DateTime value) {
        onDateSelected(value);
      },
    );
  }
}