import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget{
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    this.prefix,
    this.suffix,
    this.formatters});

  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final bool readOnly;
  final Widget ? prefix;
  final Widget ? suffix;
  final List<TextInputFormatter> ? formatters;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
     return TextFormField(
       controller: controller,
       readOnly: readOnly,
       maxLines: maxLines,
       keyboardType: textInputType,
       inputFormatters: formatters,
       decoration: InputDecoration(
         filled: true,
         fillColor: Colors.white30,
         hintStyle: TextStyle(
             color: Colors.grey
         ),
         hintText: hint,
         prefixIcon: prefix,
         suffixIcon: suffix,
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10)
         )
       ),
       autovalidateMode: AutovalidateMode.onUserInteraction,
     );
  }

}