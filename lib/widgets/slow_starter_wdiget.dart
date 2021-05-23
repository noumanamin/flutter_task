import 'package:flutter/material.dart';
import 'package:flutter_app/model/date_model.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_app/widgets/toggle_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlowStarterWidget extends StatefulWidget {
  final title;
  final check;
  final ValueChanged<String> onClick;

  List<DateModel> dateModel;

  SlowStarterWidget(
      {this.title, this.check, Key key, this.onClick, this.dateModel})
      : super(key: key);

  @override
  _SlowStarterWidgetState createState() => _SlowStarterWidgetState();
}

class _SlowStarterWidgetState extends State<SlowStarterWidget> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    List<DateModel> dateModelLoc = widget.dateModel ?? [];
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
                        for (int index = 0;
                            index < dateModelLoc.length;
                            index++)
                          GestureDetector(
                            onTap: () {
                              for (int indexI = 0;
                                  indexI < dateModelLoc.length;
                                  indexI++) {
                                dateModelLoc[indexI].select = false;
                              }
                              setState(() {
                                dateModelLoc[index].select = true;
                              });
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: index == 0 ? 0 : 10),
                              padding: EdgeInsets.only(
                                  top: 4, left: 8, right: 8, bottom: 4),
                              decoration: BoxDecoration(
                                  color: dateModelLoc[index].select ??false
                                      ? Colors.black
                                      : AppColors.dartGrayOne,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Column(
                                children: [
                                  Text(
                                    dateModelLoc[index].date,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    dateModelLoc[index].day,
                                    style: TextStyle(
                                        color: dateModelLoc[index].color),
                                  )
                                ],
                              ),
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
