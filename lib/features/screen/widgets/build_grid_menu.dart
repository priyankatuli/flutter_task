import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/core/constants/icon_path.dart';

class BuildGridMenu extends StatelessWidget{
  BuildGridMenu({super.key});


  final List<String> menuIcons = [
    IconPath.menuIcon1,
    IconPath.menuIcon2,
    IconPath.menuIcon3,
    IconPath.menuIcon4,
    IconPath.menuIcon5,
    IconPath.menuIcon6,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: menuIcons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 17,
            crossAxisSpacing: 15,
            childAspectRatio: 0.8 // ratio joto choto height toto boro
        ),
        itemBuilder: (context,index){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Image.asset(menuIcons[index],  //index onujayi icon
                      fit: BoxFit.contain,),
                  )
              ),
              SizedBox(height: 5,),
              Text(AppConstants.menuText,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),),
              SizedBox(height: 5,),
              Text("0000${index+1}",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13
              ),)


            ],
          );
        }
    );
  }

}