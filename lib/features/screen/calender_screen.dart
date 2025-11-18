import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/core/constants/icon_path.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/features/controller/bottom_navigation_controller.dart';
import 'package:flutter_task/features/controller/calendar_controller.dart';
import 'package:flutter_task/features/screen/widgets/custom_bottom_bar.dart';
import 'package:flutter_task/features/screen/widgets/custom_floating_action_button.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class CalenderScreen extends StatelessWidget{
  CalenderScreen({super.key});

  final BottomNavigationController controller = Get.put(BottomNavigationController());
  final CalendarController calendarController = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
      return PopScope(
        canPop: true,
        onPopInvoked: (didPop){
          if(!didPop) return;
          controller.currentIndex(0);

        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
            title: Center(
              child: Text(AppConstants.calenderText1,style: GoogleFonts.roboto(
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                    )),
            ),
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
                padding: EdgeInsets.only(left: 12,top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppConstants.calenderText2,style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            onPressed: (){}, child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.green.shade500,
                              Colors.lightGreen
                            ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                            alignment: Alignment.center,
                            child: Text(AppConstants.calenderText3,style: TextStyle(
                                fontSize: 15
                            ),),
                          ),
                        )
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Obx(() => SizedBox(
                            height: 80,
                            child: ListView.separated(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  final day = calendarController.days[index];
                                  final isSelected = calendarController.pickedIndex.value ==  index;
                                 return GestureDetector(
                                   onTap: () => calendarController.pickDay(index),
                                   child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: 45,
                                  decoration: BoxDecoration(
                                  //color: isSelected ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(33),
                                  border: isSelected ? Border.all(color: Colors.green.shade400, width: 2) : null,
                                  ),
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text(day.day,style: TextStyle(
                                           fontSize: 13,
                                           color: Colors.grey
                                         ),),
                                         SizedBox(height: 10,),
                                         Text('${day.date}',style: TextStyle(
                                             fontSize: 13,
                                             fontWeight: FontWeight.bold
                                         ),)
                                       ],
                                     ),
                                   ),
                                 );
                            }, separatorBuilder: (_,__){
                               return SizedBox(width: 10);
                            }, itemCount: calendarController.days.length
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomFloatingActionButton(onPressed: (){},
              imagePath: IconPath.cameraImg,
          ),
          bottomNavigationBar: Obx(() => CustomBottomBar(
              currentIndex: controller.currentIndex.value, 
              onTap: (index){
                controller.changedIndex(index);
              },
              svgPath: IconPath.subtractBottomImg
          ),
        ),
        )
      );
  }

}