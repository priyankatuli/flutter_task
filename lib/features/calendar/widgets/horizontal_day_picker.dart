import 'package:flutter/material.dart';
import 'package:flutter_task/model/day_model.dart';
import 'package:get/get.dart';

class HorizontalDayPicker extends StatelessWidget{
  const HorizontalDayPicker({super.key, required this.pickedIndex, required this.days, required this.onDayPicked});

  final RxInt pickedIndex;//selected day index;
  final List<DayModel> days;
  final Function(int) onDayPicked; // callback jokhon user tap korbe

  @override
  Widget build(BuildContext context) {
     return  Container(
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
                     final day = days[index];
                     return Obx(() {
                       bool isSelected = pickedIndex.value == index;
                       return GestureDetector(
                         onTap: () =>
                             onDayPicked(index),
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
               }, itemCount: days.length
               )),
           )
         ],
       ),
     );
  }

}