import 'package:flutter/material.dart';
import 'package:flutter_app/model/date_model.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_app/widgets/toggle_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewWithToggleSwitch extends StatefulWidget {
  final title;

  ViewWithToggleSwitch({Key key, this.title}) : super(key: key);

  @override
  _ViewWithToggleSwitchState createState() => _ViewWithToggleSwitchState();
}

class _ViewWithToggleSwitchState extends State<ViewWithToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrayOne,
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/microphone_with_wire.svg',
              width: 28,
              height: 28,
              color: AppColors.darkPurple,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            ToggleButton()
          ],
        ));
  }
}
