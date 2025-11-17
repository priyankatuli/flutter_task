import 'package:flutter/material.dart';
import 'package:flutter_task/features/screen/home_screen.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
       title: 'Flutter Task',
       initialRoute: '/home',
       getPages: [
         GetPage(name: '/home', page: () => HomeScreen(),)
       ],
       debugShowCheckedModeBanner: false,
       home: HomeScreen(),
     );
  }

}