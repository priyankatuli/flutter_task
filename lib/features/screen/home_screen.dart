import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/core/constants/icon_path.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/features/controller/bottom_navigation_controller.dart';
import 'package:flutter_task/features/screen/widgets/build_card.dart';
import 'package:flutter_task/features/screen/widgets/build_grid_menu.dart';
import 'package:flutter_task/features/screen/widgets/build_progress_part.dart';
import 'package:flutter_task/features/screen/widgets/custom_bottom_bar.dart';
import 'package:flutter_task/features/screen/widgets/custom_floating_action_button.dart';
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
                fontSize: 17,
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
       floatingActionButton: CustomFloatingActionButton(onPressed: (){},
           imagePath: IconPath.cameraImg
       ),
         bottomNavigationBar: Obx(() => CustomBottomBar(
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


