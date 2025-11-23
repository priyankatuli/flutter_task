import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget{

  final int currentIndex;
  final Function(int) onTap;
  final String svgPath;

  const CustomBottomNavBar({super.key, required this.currentIndex, required this.onTap, required this.svgPath});

  @override
  Widget build(BuildContext context) {
      return BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
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
                        onTap(0);
                        Get.toNamed('/home');},icon: Icon(Icons.home_outlined,color: currentIndex == 0 ? Colors.black : Colors.grey,
                  ),),
                  IconButton(onPressed: () {
                    onTap(1);
                    Get.toNamed('/calendar');
                  }, icon: Icon(Icons.calendar_month_outlined,
                    color: currentIndex == 1 ? Colors.black : Colors.grey,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.settings,
                      color: currentIndex == 2 ? Colors.black : Colors.grey)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.person,
                      color: currentIndex == 3 ? Colors.black : Colors.grey)),
                ],
              ),
            )
          ],
        ),
      );
  }

}