import 'package:flutter/material.dart';
import 'package:flutter_task/features/new/widgets/custom_text_field.dart';

class DropdownField extends StatelessWidget{
  const DropdownField({super.key,
    required this.controller,
    required this.hint,
    required this.onTap});

  final TextEditingController controller;
  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
      return CustomTextField(
          controller: controller,
          hint: hint,
          readOnly: true,
          suffix: GestureDetector(
            onTap: onTap,
            child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.grey.shade400,size: 26,
          ),
      )
      );
  }

}