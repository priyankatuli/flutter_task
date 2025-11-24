import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/model/event_model.dart';


class TodayWorkCard extends StatelessWidget{
  const TodayWorkCard({super.key, required this.events});

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
     return Padding(
         padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
         child: Card(
           color: Colors.white,
           elevation: 10,
           shadowColor: Colors.grey.shade800,
           margin: EdgeInsets.only(right: 10),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
           clipBehavior: Clip.none, //shadow katbe na
           child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     Padding(
                       padding: EdgeInsets.all(10),
                       child: Text(AppConstants.todayWorkText,style: TextStyle(
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
                     itemCount: events.length,
                     itemBuilder: (context,index){
                       final event = events[index];
                       return Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SizedBox(
                             width: 60,
                             child: Column(
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
         )
     );
  }

}