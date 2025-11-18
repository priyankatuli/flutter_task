import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildSmallBox extends StatelessWidget {

  final String value;
  final String label;

  const BuildSmallBox({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: value.split("").map((value){
            return Container(
              width: 28,
              height: 35,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 2),
              padding: EdgeInsets.symmetric(horizontal: 3,vertical: 7),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4)
              ),
              child: Text(value,style: GoogleFonts.roboto(
                  fontSize: 14
              ),),
            );
          }).toList(),),
        SizedBox(height: 4,),
        Text(label,style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w500
        ),)
      ],
    );
  }
}