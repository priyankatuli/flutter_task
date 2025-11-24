import 'package:flutter/material.dart';
import 'package:flutter_task/core/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_task/core/widgets/custom_floating_action_button.dart';
import 'package:flutter_task/features/calendar/screens/calender_screen.dart';
import 'package:flutter_task/features/home/controller/bottom_navigation_controller.dart';
import 'package:flutter_task/features/home/screens/home_screen.dart';
import 'package:flutter_task/features/settings/screen/settings_screen.dart';
import 'package:get/get.dart';

import '../constants/icon_path.dart';

class MainBottomNavigationScreen extends StatelessWidget{
  MainBottomNavigationScreen({super.key});

  final BottomNavigationController navController = Get.put(BottomNavigationController());


  final List<Widget> screens = [
    HomeScreen(),
    CalenderScreen(),
    SettingsScreen(),
    //PersonScreen()
  ];

  @override
  Widget build(BuildContext context) {
      return Obx((){
         return Scaffold(
          body: screens[navController.currentIndex.value],
          bottomNavigationBar: CustomBottomNavBar(
              svgPath: IconPath.subtractBottomImg
          ),
           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
           floatingActionButton: CustomFloatingActionButton(
               onPressed: (){},
               imagePath: IconPath.cameraImg
           ),
         );
      });
  }

}