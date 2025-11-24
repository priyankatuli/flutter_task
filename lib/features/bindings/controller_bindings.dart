import 'package:flutter_task/core/widgets/main_bottom_navigation_screen.dart';
import 'package:flutter_task/features/calendar/controller/calendar_controller.dart';
import 'package:flutter_task/features/home/controller/bottom_navigation_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies() {

    Get.put(() => BottomNavigationController());
    Get.put(() => CalendarController());

  }

}