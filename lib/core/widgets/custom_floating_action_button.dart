import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget{
  final VoidCallback onPressed;
  final String ? imagePath;
  final double size;
  final Color? iconColor;

  const CustomFloatingActionButton({super.key,
    required this.onPressed,
    required this.imagePath,
    this.size = 70,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
     return FloatingActionButton(onPressed: onPressed,
       backgroundColor: Colors.transparent,
       elevation: 0,
       child: Container(
         width: size,
         height: size,
         decoration: BoxDecoration(
           gradient: LinearGradient(colors: [
             Colors.green.shade200,
             Colors.green.shade700],
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
           ),
           shape: BoxShape.circle,
         ),
         child: Image.asset(imagePath!,color: iconColor,)
       ),
     );
  }

}