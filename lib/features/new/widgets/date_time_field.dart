import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/features/new/widgets/custom_text_field.dart';

class DateTimeField extends StatelessWidget{
  const DateTimeField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
      return CustomTextField(
          controller: controller,
          hint: AppConstants.selectIt,
          readOnly: true,
          prefix: IconButton(
              onPressed: () async{
                DateTime ? pickedDate = await showDatePicker(
                    context: context,
                    initialDate : DateTime.now(),
                    firstDate : DateTime(2000),
                    lastDate : DateTime(2100)
                );
                if(pickedDate != null){
                  controller.text = "${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}";
                }
              },
              icon: Icon(Icons.calendar_month_outlined,color: Colors.grey.shade400,size: 20,)),
        suffix: IconButton(
            onPressed: () async{
              TimeOfDay ? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now()
              );
              if(pickedTime != null){
                String formattedTime = "${pickedTime.hour} : ${pickedTime.minute.toString().padLeft(2, '0')}";
                controller.text = "${controller.text} $formattedTime";
              }

            },
            icon: Icon(Icons.keyboard_arrow_right_sharp,color: Colors.grey.shade400,size: 26,)),
      );
  }

}