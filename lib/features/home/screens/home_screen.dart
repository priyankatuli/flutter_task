import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/widgets/build_card.dart';
import 'package:flutter_task/features/home/widgets/build_grid_menu.dart';
import 'package:flutter_task/features/home/widgets/build_progress_part.dart';
import 'package:flutter_task/features/home/widgets/custom_home_appbar.dart';
import 'package:get/get.dart';

import '../controller/bottom_navigation_controller.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});

  final BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {

    //appbar eita ke override kore
   /* SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light
    ));
    */
     return Scaffold(
       appBar: CustomHomeAppBar(),
       body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  BuildCard(),
                  //SizedBox(height: 5,),
                  BuildProgressPart(),
                  //SizedBox(height: 5,),
                  BuildGridMenu(),
                ])
          )
       ),
       drawer: Drawer(),
     );
  }

}


