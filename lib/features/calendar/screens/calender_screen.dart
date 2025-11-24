import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/features/calendar/widgets/custom_calendar_appbar.dart';
import 'package:flutter_task/features/calendar/widgets/horizontal_day_picker.dart';
import 'package:flutter_task/features/calendar/widgets/today_work_card.dart';
import 'package:get/get.dart';
import '../../home/controller/bottom_navigation_controller.dart';
import '../controller/calendar_controller.dart';

class CalenderScreen extends StatelessWidget{
  CalenderScreen({super.key,});

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
          appBar: CustomCalendarAppbar(),
          body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(left: 12,top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Obx(() {
                             final selected = calendarController.days[calendarController.pickedIndex.value];
                             return Text("আজ ${selected.banglaDate} জুলাই" ,style: TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.bold
                             ),);
            }),
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
                    HorizontalDayPicker(
                        pickedIndex: calendarController.pickedIndex,
                        days: calendarController.days,
                        onDayPicked: (index) => calendarController.pickDay(index)
                    ),
                    SizedBox(height: 15,),
                    TodayWorkCard(
                      events: calendarController.events,
                    ),
                  ])
      )),)
      );
  }

}