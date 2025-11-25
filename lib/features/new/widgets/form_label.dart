import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget{
  const FormLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
    );
  }

}