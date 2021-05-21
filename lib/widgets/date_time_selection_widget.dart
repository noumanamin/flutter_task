import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateTimeSelectionWidget extends StatefulWidget {
  final title;
  final prefixIcon;
  final sufixIcon;
  final hide;

  DateTimeSelectionWidget(
      {Key key, this.title, this.prefixIcon, this.sufixIcon, this.hide});

  @override
  _DateTimeSelectionWidgetState createState() =>
      _DateTimeSelectionWidgetState();
}

class _DateTimeSelectionWidgetState extends State<DateTimeSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    bool hide = widget.hide ?? false;
    return Column(
      children: [
        Row(
          children: [
            widget.prefixIcon ??
                Container(
                  width: 0,
                  height: 0,
                ),
            SizedBox(
              width: 10,
            ),
            Expanded(child: widget.title),
            SizedBox(
              width: 4,
            ),
            Container(
              width: 24,
              height: 24,
              color: AppColors.white,
              child: widget.sufixIcon ??
                  Container(
                    width: 0,
                    height: 0,
                  ),
            ),
          ],
        ),
        if (!hide)
          Divider(
            thickness: 2,
            color: Colors.black,
          )
      ],
    );
  }
}
