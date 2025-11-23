import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/core/constants/icon_path.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_task/core/widgets/custom_floating_action_button.dart';
import 'package:flutter_task/features/home/widgets/build_card.dart';
import 'package:flutter_task/features/home/widgets/build_grid_menu.dart';
import 'package:flutter_task/features/home/widgets/build_progress_part.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/bottom_navigation_controller.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});

  final BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0,
         leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
         title: Row(
           children: [
             Image.asset(IconPath.appBarIcon,width: 30,height: 40,),
             SizedBox(width: 5,),
             Text(AppConstants.appBarText,style: GoogleFonts.roboto(
                fontSize: 17,
                fontWeight: FontWeight.w500
           )),
  ]),
         actions: [
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                 child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 0, end: 0),
                   badgeStyle: badges.BadgeStyle(
                     badgeColor: AppColors.dotColor,
                     padding: EdgeInsets.all(5)
                   ),
                   child: CircleAvatar(
                     backgroundColor: Colors.grey.shade200,
                     child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active_outlined,color: AppColors.notificationColor,size: 20,)),
                   ),
                 ),
               )
         ],
       ),
       body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  BuildCard(),
                  //SizedBox(height: 5,),
                  /*IndexedStack(
                    index: 0,
                    children: [
                      HomeScreen(),
                      CalenderScreen()
                    ],
                  ),*/
                  BuildProgressPart(),
                  //SizedBox(height: 5,),
                  BuildGridMenu(),
                ])
          )
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       floatingActionButton: CustomFloatingActionButton(onPressed: (){},
           imagePath: IconPath.cameraImg
       ),
         bottomNavigationBar: Obx(() => CustomBottomNavBar(
             currentIndex: controller.currentIndex.value,
             onTap: (index){
                 controller.changedIndex(index);
             },
             svgPath: IconPath.subtractBottomImg
         )
         ),
     );
  }
}


