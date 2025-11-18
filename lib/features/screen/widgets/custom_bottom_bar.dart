import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomBottomBar extends StatelessWidget{

  final int currentIndex;
  final Function(int) onTap;
  final String svgPath;

  const CustomBottomBar({super.key,
    required this.currentIndex,
    required this.onTap,
    required this.svgPath});

  @override
  Widget build(BuildContext context) {
      return BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
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
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -80,
                  left: 0,
                  right: 0,
                  bottom: -70,
                  child: FittedBox(
                    fit: BoxFit.cover,
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
          ),
        ),
      );
  }

}