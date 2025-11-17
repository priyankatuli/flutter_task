import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/core/constants/icon_path.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/features/controller/bottom_navigation_controller.dart';
import 'package:flutter_task/features/screen/widgets/build_card.dart';
import 'package:flutter_task/features/screen/widgets/build_grid_menu.dart';
import 'package:flutter_task/features/screen/widgets/build_progress_part.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});

  final BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
         leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
         title: Row(
           children: [
             Image.asset(IconPath.appBarIcon,width: 30,height: 40,),
             SizedBox(width: 7,),
             Text(AppConstants.appBarText,style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500
           )),
  ]),
         actions: [
           Padding(
               padding: EdgeInsets.only(right: 12.0),
               child: Stack(
                 children: [
                   CircleAvatar(
                       backgroundColor: Colors.grey.shade200,
                       child: IconButton(onPressed: (){},
                           icon: Icon(Icons.notifications,color: AppColors.notificationColor,))),
                   Positioned(
                     right: 0,
                       top: 0,
                       child: Container(
                         height: 10,
                         width: 10,
                         decoration: BoxDecoration(
                           color: AppColors.dotColor,
                           shape: BoxShape.circle
                         ),
                       )
                   )
                 ]
               ))
         ],
       ),
       body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  BuildCard(),
                  SizedBox(height: 5,),
                  BuildProgressPart(),
                  SizedBox(height: 5,),
                  BuildGridMenu(),
                ])
          )
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       floatingActionButton: FloatingActionButton(onPressed: (){},
       backgroundColor: Colors.transparent,
         elevation: 0,
         child: Container(
             width: 70,
             height: 70,
             decoration: BoxDecoration(
               gradient: LinearGradient(colors: [
                 Colors.green.shade200,
                 Colors.green.shade700
               ],
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight
               ),
               shape: BoxShape.circle,
             ),
             child: Image.asset(IconPath.cameraImg,color: Colors.white,),
       ),
       ),
         bottomNavigationBar: BottomAppBar(
           shape: CircularNotchedRectangle(),
           notchMargin: 6,
           child: SizedBox(
             height: 100, //bottomNavigationBar er height
             child: ClipRRect(
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(12),   // top radius
                 topRight: Radius.circular(12),
               ),
               child: Stack(
                 children: [
                   Positioned(
                     top: -80, //svg ke bottomBar er upore shift koranor jonno negative value
                     left: 0,
                     right: -5,
                     bottom: -70 ,
                     child: FittedBox(
                       fit: BoxFit.cover,
                       child: SvgPicture.asset(
                         IconPath.subtractBottomImg,
                         width: MediaQuery.of(context).size.width,
                         height: 175,
                       ),
                     ),
                   ),
                   Obx(() => Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       IconButton(onPressed: (){
                         //navigate to home using Getx
                         controller.changedIndex(0);
                       }, icon: Icon(Icons.home_outlined,color: controller.currentIndex.value == 0 ? Colors.black : Colors.grey,
                       ),),
                       IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month_outlined,
                         color: controller.currentIndex.value == 1 ? Colors.black : Colors.grey,)),
                       IconButton(onPressed: (){}, icon: Icon(Icons.settings,
                           color: controller.currentIndex.value == 2 ? Colors.black : Colors.grey)),
                       IconButton(onPressed: (){}, icon: Icon(Icons.person,
                           color: controller.currentIndex.value == 3 ? Colors.black : Colors.grey)),
                     ],
                   )
                   )
                 ],
               ),
             ),
           ),
         )
     );
  }
}


