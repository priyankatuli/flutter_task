import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget{
  const CustomButton({super.key,
    required this.text,
    required this.onPressed,
    required this.fontSize
  });

  final String text;
  final VoidCallback onPressed;
  final double fontSize;


  @override
  Widget build(BuildContext context) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 0),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
    ),
    fixedSize: Size.fromWidth(double.maxFinite),
    foregroundColor: Colors.white,
    backgroundColor: Colors.green
        ),
          onPressed: onPressed,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(text,style: TextStyle(fontSize: fontSize,),))
      );
  }

}