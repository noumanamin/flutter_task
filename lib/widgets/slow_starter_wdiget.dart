import 'package:flutter/material.dart';
import 'package:flutter_app/model/date_model.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_app/widgets/toggle_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlowStarterWidget extends StatefulWidget {
  final title;
  final check;
  final ValueChanged<String> onClick;

  SlowStarterWidget({this.title, this.check, Key key, this.onClick})
      : super(key: key);

  @override
  _SlowStarterWidgetState createState() => _SlowStarterWidgetState();
}

class _SlowStarterWidgetState extends State<SlowStarterWidget> {
  bool click = false;

  List<DateModel> dateModel = [
    DateModel(date: "20 Mar", day: "Sun", color: Colors.red),
    DateModel(date: "21 Mar", day: "Mon", color: Colors.green),
    DateModel(date: "22 Mar", day: "Tue", color: Colors.pink),
    DateModel(date: "23 Mar", day: "Wed", color: Colors.amber),
    DateModel(date: "24 Mar", day: "Thu", color: Colors.blue),
    DateModel(date: "25 Mar", day: "Fri", color: Colors.brown),
    DateModel(date: "26 Mar", day: "Sat", color: Colors.deepOrange),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(minutes: 0),
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
      child: Column(
        children: [
          Row(
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
              ToggleButton(
                check: widget.check,
                onClick: (value) {
                  widget.onClick(widget.title);
                },
              )
            ],
          ),
          if (widget.check ?? false)
            SizedBox(
              height: 10,
            ),
          if (widget.check ?? false)
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 32,
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int index = 0; index < dateModel.length; index++)
                          Container(
                            margin: EdgeInsets.only(left: index == 0 ? 0 : 10),
                            padding: EdgeInsets.only(
                                top: 4, left: 8, right: 8, bottom: 4),
                            decoration: BoxDecoration(
                                color: AppColors.dartGrayOne,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Column(
                              children: [
                                Text(
                                  dateModel[index].date,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  dateModel[index].day,
                                  style:
                                      TextStyle(color: dateModel[index].color),
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 32,
                ),
              ],
            )
        ],
      ),
    );
  }
}
