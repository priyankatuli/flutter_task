import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/features/home/controller/bottom_navigation_controller.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget{
  final String svgPath;

  const CustomBottomNavBar({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {

    final BottomNavigationController controller = Get.put(BottomNavigationController());

      return Obx(() => BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          shape: CircularNotchedRectangle(),
          notchMargin:  5,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -80,
                left: -65,
                right: -67,
                bottom: -80,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SvgPicture.asset(svgPath,
                    width: MediaQuery.of(context).size.width,
                    height: 175,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {
                          controller.changedIndex(0);
                          //Get.toNamed('/home');
                          },icon: Icon(Icons.home_outlined,color: controller.currentIndex.value == 0 ? Colors.black : Colors.grey,
                    ),),
                    IconButton(onPressed: () {
                      controller.changedIndex(1);
                      //Get.toNamed('/calendar');
                      }, icon: Icon(Icons.calendar_month_outlined,
                      color: controller.currentIndex.value == 1 ? Colors.black : Colors.grey,)),
                    IconButton(onPressed: (){
                        controller.changedIndex(2);
                    }, icon: Icon(Icons.settings,
                        color: controller.currentIndex.value == 2? Colors.black : Colors.grey)),
                    IconButton(onPressed: (){
                         controller.changedIndex(3);
                    }, icon: Icon(Icons.person,
                        color: controller.currentIndex.value == 3 ? Colors.black : Colors.grey)),
                  ],
                ),)
            ],
          ),
        ),
      );
  }
}