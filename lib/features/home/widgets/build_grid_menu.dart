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
    return GestureDetector(
      onTap: (){
      },
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: menuIcons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              //mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              childAspectRatio: 0.9 // ratio joto choto height toto boro
          ),
          itemBuilder: (context,index){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: 55,
                    height: 55,
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
                SizedBox(height: 3,),
                Text(AppConstants.menuText,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),),
                SizedBox(height: 2,),
                Text("0000${index+1}",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                ),)


              ],
            );
          }
      ),
    );
  }

}