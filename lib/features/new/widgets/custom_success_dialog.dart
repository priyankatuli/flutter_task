import 'package:flutter/material.dart';

class CustomSuccessDialog extends StatelessWidget{
  const CustomSuccessDialog({super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.onButtonTap
  });

  final String imagePath;
  final String title;
  final String subTitle;
  final String buttonText;
  final VoidCallback onButtonTap;


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath,width: 100,height: 100,fit: BoxFit.contain,),
            SizedBox(height: 20,),
            //title
            Text(title,style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Text(subTitle,style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
               // Navigator.pop(context);
                onButtonTap();
              },style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen.shade700,
                      padding: EdgeInsets.symmetric(vertical: 17),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  child: Text(buttonText,style: TextStyle(
                      fontSize: 17,
                      color: Colors.white
                  ),)
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

}