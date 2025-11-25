import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/features/new/widgets/custom_button.dart';
import 'package:flutter_task/features/new/widgets/custom_success_dialog.dart';
import 'package:flutter_task/features/new/widgets/custom_text_field.dart';
import 'package:flutter_task/features/new/widgets/date_time_field.dart';
import 'package:flutter_task/features/new/widgets/dropdown_field.dart';
import 'package:flutter_task/features/new/widgets/form_label.dart';
import 'package:flutter_task/features/new/widgets/word_limit_formatter.dart';

import '../../../core/constants/icon_path.dart';

class AddNewTaskScreen extends StatefulWidget{
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<AddNewTaskScreen> {

  final TextEditingController paragraphController = TextEditingController();
  final TextEditingController paragraphDivisionController =  TextEditingController();
  final TextEditingController dateAndTimeController =  TextEditingController();
  final TextEditingController placeController =  TextEditingController();
  final TextEditingController paragraphDetailsController =  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            centerTitle: true,
            title: Text(AppConstants.newPageText,style: TextStyle(fontSize: 15,),)
          ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FormLabel(AppConstants.newParagraph1),
                      Text(AppConstants.newParagraphCount,style: TextStyle(color: Colors.grey.shade600),)
                    ],
                  ),
                  SizedBox(height: 7,),
                  CustomTextField(
                      controller: paragraphController,
                      hint: AppConstants.paragraphWriting,
                      formatters: [WordLimitFormatter(45)],
                      maxLines: 1,
                  ),
                  SizedBox(height: 15,),
                  FormLabel(AppConstants.paragraphDivision),
                  SizedBox(height: 7,),
                  DropdownField(
                      controller: paragraphDivisionController,
                      hint: AppConstants.paragraphDivisionSelect,
                      onTap: () =>  _showDropDownBox(context),
                  ),
                  SizedBox(height: 10,),
                  FormLabel(AppConstants.dateAndTime),
                  SizedBox(height: 10,),
                  DateTimeField(
                    controller: dateAndTimeController,
                  ),
                  SizedBox(height: 10,),
                  FormLabel(AppConstants.placeIt),
                  SizedBox(height: 7,),
                  DropdownField(
                      controller: placeController,
                      hint:  AppConstants.selectIt,
                      onTap: () => _showDropDownBox(context),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppConstants.paragraphDetails,style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),),
                      Text(AppConstants.paragraphDetailsCount,style: TextStyle(fontSize: 15,color: Colors.grey.shade500),)
              ]
                  ),
                  SizedBox(height: 7,),
                  CustomTextField(
                      controller: paragraphDetailsController,
                      hint: AppConstants.selectTaskDetails,
                      formatters: [WordLimitFormatter(120)],
                      maxLines: 6,
                  ),
                  SizedBox(height: 7,),
                  CustomButton(
                      text: AppConstants.collectIt,
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          showCustomDialog(context);
                        }
                      },
                      fontSize: 16
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

 void showCustomDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false, //dialog er baire screen tap korle dialog off hobe  na
      builder: (BuildContext context) {
         return CustomSuccessDialog(
             imagePath: IconPath.checkImg,
             title: AppConstants.dialogTitle,
             subTitle: AppConstants.dialogSubtitle,
             buttonText: AppConstants.dialogButtonText,
             onButtonTap: (){
               Navigator.pop(context);
             }
         );
    },);
 }
 Future <void> _showDropDownBox(BuildContext context) async {

    List<String> places = ["ঢাকা", "চট্টগ্রাম", "রাজশাহী", "খুলনা", "বরিশাল",];
    String ? selected = await showModalBottomSheet<String>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20)
          )
        ),
        builder: (context){
         return Padding(
             padding: EdgeInsets.all(15),
             child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Text("একটি স্থান নির্বাচন করুন", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                  ...places.map((item) => ListTile(
                          title: Text(item),
                                  onTap: () => Navigator.pop(context, item),)),
          ],
         ),
         );});
    if(selected!=null){
      paragraphDivisionController.text = selected;
      placeController.text = selected;
    }

  }

  @override
  void dispose(){
    super.dispose();
    paragraphController.dispose();
    paragraphDivisionController.dispose();
    paragraphDetailsController.dispose();
    dateAndTimeController.dispose();
    placeController.dispose();
  }
}
