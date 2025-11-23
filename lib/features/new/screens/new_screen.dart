import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/features/new/widgets/word_limit_formatter.dart';

class NewScreen extends StatefulWidget{
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {

  final TextEditingController paragraphController = TextEditingController();
  final TextEditingController paragraphDivisionController =  TextEditingController();
  final TextEditingController dateAndTimeController =  TextEditingController();
  final TextEditingController placeController =  TextEditingController();
  final TextEditingController paragraphDetailsController =  TextEditingController();

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(AppConstants.notunPageText,style: TextStyle(fontSize: 15,),)
          ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('অনুচ্ছেদ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    Text('৪৫ শব্দ',style: TextStyle(color: Colors.grey.shade600),)
                  ],
                ),
                SizedBox(height: 7,),
                TextFormField(
                  controller: paragraphController,
                  inputFormatters: [
                     WordLimitFormatter(45),
                  ],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white30,
                    filled: true,
                    hintText: 'অনুচেছদ লিখুন',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  maxLines: null,
                  minLines: 1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 15,),
                Text('অনুচ্ছেদের বিভাগ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(height: 7,),
                TextFormField(
                  controller: paragraphDivisionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'অনুচ্ছেদের বিভাগ নির্বাচন করুন',
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    suffixIcon: GestureDetector(
                        onTap: (){
                          _showDropDownBox(context);
                        },
                        child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.grey.shade400,size: 26,))
                  ),
                  maxLines: 1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 10,),
                Text('তারিখ ও সময়',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(height: 10,),
                TextFormField(
                  controller: dateAndTimeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: GestureDetector(
                          onTap: () async{
                            DateTime ? pickedDate = await showDatePicker(
                                context: context,
                                initialDate : DateTime.now(),
                                firstDate : DateTime(2000),
                                lastDate : DateTime(2100)
                            );
                            if(pickedDate != null){
                              dateAndTimeController.text = "${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}";
                            }
                          },
                          child: Icon(Icons.calendar_month_outlined,color: Colors.grey.shade400,size: 20,)),
                      hintText: 'নির্বাচন করুন',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      suffixIcon: GestureDetector(
                          onTap: (){
                           // _showTime(context);
                          },
                          child: Icon(Icons.keyboard_arrow_right_sharp,color: Colors.grey.shade400,size: 26,))
                  ),
                  maxLines: 1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 10,),
                Text('স্থান',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(height: 7,),
                TextFormField(
                  controller: placeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on,color: Colors.grey.shade400,size: 20,),
                      hintText: 'নির্বাচন করুন',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      suffixIcon: GestureDetector(
                          onTap: (){
                             _showDropDownBox(context);
                          },
                          child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.grey.shade400,size: 26,))
                  ),
                  maxLines: 1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('অনুচ্ছেদের বিবরণ',style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                    Text('১২০ শব্দ',style: TextStyle(fontSize: 15,color: Colors.grey.shade500),)
            ]
                ),
                SizedBox(height: 7,),
                TextFormField(
                  controller: paragraphDetailsController,
                  inputFormatters: [
                     WordLimitFormatter(120)
                  ],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'কার্যক্রমের বিবরণ লিখুন',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  maxLines: 6,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 7,),
                ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                        ),
                        fixedSize: Size.fromWidth(double.maxFinite),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green
                      ), onPressed: () {

                },
                      child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('সংরক্ষণ করুন',style: TextStyle(fontSize: 15,),))),
              ],
            ),
          ),
        ),
      );
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
}
