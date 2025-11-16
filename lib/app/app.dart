import 'package:flutter/material.dart';
import 'package:flutter_task/features/screen/home_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
       title: 'Flutter Task',
       debugShowCheckedModeBanner: false,
       home: HomeScreen(),
     );
  }

}