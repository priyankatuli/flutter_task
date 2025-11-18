import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_constants.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/features/screen/widgets/build_small_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BuildProgressPart extends StatelessWidget{
  const BuildProgressPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: CircularPercentIndicator(
                      radius: 55,
                      lineWidth: 9,
                      percent: 0.6,
                      center: Text(
                        AppConstants.progressText4,
                        style: GoogleFonts.roboto(fontSize: 14,),
                      ),
                      backgroundColor: AppColors.progressColor,
                      progressColor: Colors.green,
                    ),
                  ),
                  SizedBox(height: 7),
                  Center(
                    child: Text(
                        AppConstants.progressText5,
                        style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(width: 20,),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  AppConstants.timeText6,
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 4),
                // Calendar row
                Row(
                  children: [
                    Icon(Icons.calendar_month, size: 18),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        AppConstants.timeText7,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                // Red text
                Text(
                  AppConstants.timeText8,
                  style: GoogleFonts.roboto(
                    color: Colors.red.shade400,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildSmallBox(value: '০৫', label: 'বছর'),
                      BuildSmallBox(value: '০৬', label: 'মাস'),
                      BuildSmallBox(value: '১২', label: 'দিন'),
                    ],
                  ),
                  ]
            ),
          ),
        ],
      ),
    );
  }

}