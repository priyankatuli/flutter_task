import 'package:flutter_task/model/day_model.dart';
import 'package:flutter_task/model/event_model.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController {

  RxInt pickedIndex = 0.obs;
  final days = <DayModel>[].obs;
  final events = <EventModel>[].obs;
  //RxInt pickedIndex = (-1).obs; //kuno item e selected na

  @override
  void onInit() {
    super.onInit();
    days.addAll([
      DayModel(day: 'মঙ্গল', date: 9),
      DayModel(day: 'বুধ', date: 10),
      DayModel(day: 'বৃহ', date: 11),
      DayModel(day: 'শুক্র', date: 12),
      DayModel(day: 'শনি', date: 13),
      DayModel(day: 'রবি', date: 14),
      DayModel(day: 'সোম', date: 15),
      DayModel(day: 'সোম', date: 16),
      DayModel(day: 'সোম', date: 17),
      DayModel(day: 'সোম', date: 18),
    ]);
    events.addAll([
      EventModel(time: '১০:০০ মি',
          title: 'তরুণ কিশোর ছেলে,আমরা আজিকে ভাবিয়া না পাই তুমি হেতা কেন এলে?',
          subTitle: 'অনুচ্ছেদ',
          location: 'ঢাকা, বাংলাদেশ'),
      EventModel(time: '১২:০০ মি',
          title: 'হযত তাহারি অলকে বাঁিতে মাথেঠের কুসুম ফুল, কতদুর পথ ঘুরিয়া মরিছ কত পথ করি ভু্ল',
          subTitle: 'বাক্য',
          location: 'ঢাকা, বাংলাদেশ'),
      EventModel(time: '০২:০০ মি',
          title: 'হযত তাহারি অলকে বাঁিতে মাথেঠের কুসুম ফুল, কতদুর পথ ঘুরিয়া মরিছ কত পথ করি ভুল',
          subTitle: 'শব্দ',
          location: 'ঢাকা, বাংলাদেশ'),
      EventModel(time: '১০:০০ মি',
          title: 'তরুণ কিশোর ছেলে, আমরা আজিকে ভাবিয়া না পাই তুমি হেতা কেন এলে?',
          subTitle: 'শব্দ',
          location: 'ঢাকা, বাংলাদেশ'),
    ]);
  }

  void pickDay(int index) {
    pickedIndex.value = index; //pickedIndex = 0
    //isSelected.value = pickedIndex.value ==  index;
    print('picked: $pickedIndex}');
  }

}
