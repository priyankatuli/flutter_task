import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCalendarAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomCalendarAppbar({super.key});

  @override
  Widget build(BuildContext context) {
     return AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
       systemOverlayStyle: SystemUiOverlayStyle.dark,  //icon dark
       leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
       title: Center(
         child: Text(AppConstants.calenderText1,style: GoogleFonts.roboto(
             fontSize: 17,
             fontWeight: FontWeight.w500
         )),
       ),
       actions: [
         Padding(
             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
             child: badges.Badge(
               position: badges.BadgePosition.topEnd(top: 0,end: 0),
               badgeStyle: badges.BadgeStyle(
                   badgeColor: AppColors.dotColor,
                   padding: EdgeInsets.all(5)
               ),
               child: CircleAvatar(
                 backgroundColor: Colors.grey.shade200,
                 child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active_outlined,color: AppColors.notificationColor,size: 20,)),
               ),
             )
         )
       ],
     );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight); //flutter jante chai tmr height koto

}