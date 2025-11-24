import 'package:flutter/material.dart';
import 'package:flutter_task/core/widgets/main_bottom_navigation_screen.dart';
import 'package:flutter_task/features/new/screens/add_new_task_screen.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
       title: 'Flutter Task',
       //initialRoute: '/main',
       //initialRoute: '/home',
       getPages: [
        /* GetPage(
           name: '/main',
           page: () => MainBottomNavigationScreen(),
           binding: ControllerBindings()
         ),
         */
         //GetPage(name: '/calendar',page: () => CalenderScreen()),
         GetPage(name: '/new',page: () => AddNewTaskScreen()),

       ],
       debugShowCheckedModeBanner: false,
      home: MainBottomNavigationScreen(),
     );
  }

}