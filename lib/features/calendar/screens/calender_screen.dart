import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/core/constants/icon_path.dart';
import 'package:flutter_task/core/theme/app_colors.dart';


import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../../core/widgets/custom_floating_action_button.dart';
import '../../home/controller/bottom_navigation_controller.dart';
import '../controller/calendar_controller.dart';

class CalenderScreen extends StatelessWidget{
  CalenderScreen({super.key});

  final BottomNavigationController controller = Get.put(BottomNavigationController());
  final CalendarController calendarController = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {

    //default style set howa
    return PopScope(
        canPop: true,
        onPopInvoked: (didPop){
          if(!didPop) return;
          controller.currentIndex(0);

        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,  //icon dark
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
            title: Center(
              child: Text(AppConstants.calenderText1,style: GoogleFonts.roboto(
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                    )),
            ),
            actions: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: 0,end: 0),
                    badgeStyle: badges.BadgeStyle(
                        badgeColor: AppColors.dotColor,
                        padding: EdgeInsets.all(5)
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active_outlined,color: AppColors.notificationColor,size: 20,)),
                    ),
                  )
              )
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
                        GestureDetector(
                          onTap: (){
                            Get.toNamed('/new');
                          },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(12),
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(colors: [
                                   Colors.lightGreen.shade400,
                                   Colors.green.shade700
                                 ]),
                                 borderRadius: BorderRadius.circular(10)
                               ),
                               child: Center(
                                 child: Text(AppConstants.calenderText3,style: TextStyle(
                                   color: Colors.white
                                 ),),
                               ),
                            )
                        )
                       ]
                        ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      margin: EdgeInsets.only(right: 13,left: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Obx(() => SizedBox(
                            height: 80,
                            child: ListView.separated(
                                padding: EdgeInsets.symmetric(horizontal: 7,),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  final day = calendarController.days[index];
                                 return Obx(() {
                                   bool isSelected = calendarController.pickedIndex.value == index;
                                   return GestureDetector(
                                     onTap: () =>
                                         calendarController.pickDay(index),
                                     child: AnimatedContainer(
                                       duration: Duration(milliseconds: 200),
                                       width: 45,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(
                                             33),
                                         border: isSelected ? Border.all(
                                             color: Colors.green.shade400,
                                             width: 2) : null,
                                       ),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Text(day.day, style: TextStyle(
                                               fontSize: 13,
                                               color: Colors.grey
                                           ),),
                                           SizedBox(height: 10,),
                                           Text(day.banglaDate, style: TextStyle(
                                               fontSize: 13,
                                               fontWeight: FontWeight.bold
                                           ),)
                                         ],
                                       ),
                                     ),
                                   );
                                 }
                                 );
                            }, separatorBuilder: (_,__){
                               return SizedBox(width: 10);
                            }, itemCount: calendarController.days.length
                            )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                        child: Card(
                          color: Colors.white,
                          elevation: 3,
                          margin: EdgeInsets.only(right: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(AppConstants.ajkerKajText,style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                ],),
                              SizedBox(height: 12,),
                              ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(), //scrollable disable kore dei
                                  itemCount: calendarController.events.length,
                                  itemBuilder: (context,index){
                                    final event = calendarController.events[index];
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                index == 0 ? 'সকাল' : index == 1 ? 'দুপুর' : 'রাত',
                                                style: TextStyle(fontSize: 12, color: Colors.black54),
                                              ),
                                            Text(event.time, style: TextStyle(
                                                  fontSize: 13, fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                   SizedBox(width: 5),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 9,vertical: 4),
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Colors.lightGreen.shade600,Colors.green.shade700],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [BoxShadow(color: Colors.black12,
                                                blurRadius: 6, offset: Offset(0,4))],
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                              Icon(Icons.schedule,size: 17,color: Colors.white,),
                                              SizedBox(width: 4,),
                                              Text(event.time,style: TextStyle(
                                                  color: Colors.white
                                              ),),],
                                              ),
                                              SizedBox(height: 4,),
                                              Text(event.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 13)),
                                              SizedBox(height: 5),
                                              Text(event.subTitle, style: TextStyle(color: Colors.white70)),
                                              Row(
                                                children: [
                                                  Icon(Icons.location_on_outlined,size: 17,color: Colors.white,),
                                                  SizedBox(width: 4,),
                                                  Text(event.location,style: TextStyle(color: Colors.white,fontSize: 13),)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),

               ]),
                        ))])
      )),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomFloatingActionButton(onPressed: (){},
              imagePath: IconPath.cameraImg,
          ),
          bottomNavigationBar: Obx(() => CustomBottomNavBar(
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