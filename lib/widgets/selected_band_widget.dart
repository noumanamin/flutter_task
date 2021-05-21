import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class SelectedBandWidget extends StatefulWidget {
  @override
  _SelectedBandWidgetState createState() => _SelectedBandWidgetState();
}

class _SelectedBandWidgetState extends State<SelectedBandWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/microphone_with_wire.svg',
              width: 18,
              height: 18,
              color: AppColors.darkPurple,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                "Brooks & Dunn",
                style: TextStyle(color: AppColors.lightGray),
              ),
            ),
            Text(
              "MON 14 AUG,2021...",
              style: TextStyle(color: AppColors.darkPurple),
            ),
            SizedBox(
              width: 12,
            ),
            Icon(Icons.remove_red_eye_outlined, color: AppColors.darkPurple),
            SizedBox(
              width: 12,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: double.infinity,
          lineThickness: 2.0,
          dashLength: 8.0,
          dashColor: AppColors.darkPurple,
          dashRadius: 0.0,
          dashGapLength: 4.0,
          dashGapColor: Colors.transparent,
          dashGapRadius: 0.0,
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
