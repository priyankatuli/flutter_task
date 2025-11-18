import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/icon_path.dart';

class BuildCard extends StatelessWidget{
  const BuildCard({super.key});

  @override
  Widget build(BuildContext context) {
     return Card(
       elevation: 4,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(16),
       ),
       margin: EdgeInsets.all(16),
       child: Padding(
         padding: EdgeInsets.all(14),
         child: Row(
           children: [
             CircleAvatar(
                 radius: 35,
                 backgroundColor: Colors.grey.shade200,
                 backgroundImage: AssetImage(IconPath.profileIcon)
             ),
             SizedBox(width: 10,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(AppConstants.cardText1,style: GoogleFonts.roboto(
                     fontWeight: FontWeight.bold,
                     fontSize: 17
                 ),),
                 SizedBox(height: 5,),
                 Text(AppConstants.cardText2,style: GoogleFonts.roboto(
                     fontWeight: FontWeight.w200
                 ),),
                 Row(
                   children: [
                     Icon(Icons.location_on_outlined,size:18),
                     SizedBox(height: 8,),
                     Text(AppConstants.cardText3)
                   ],
                 )
               ],
             )
           ],
         ),
       ),
     );
  }

}