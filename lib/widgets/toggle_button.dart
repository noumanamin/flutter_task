import 'package:flutter/material.dart';
import 'package:flutter_app/model/date_model.dart';
import 'package:flutter_app/utils/app_colors.dart';

class ToggleButton extends StatefulWidget {
  final check;
  final ValueChanged<String> onClick;
  ToggleButton({this.check, Key key,this.onClick}) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

const double width = 40.0;
const double height = 20.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _ToggleButtonState extends State<ToggleButton> {
  double xAlign;
  Color loginColor;
  Color signInColor;
  bool click = false;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;

  }

  @override
  Widget build(BuildContext context) {
    click = widget.check ?? false;
    click ? active() : inActive();
    return GestureDetector(
      onTap: () {
        updateButton(click);
        widget.onClick("");
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: click ? Colors.green : AppColors.lightGrayTwo,
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(xAlign, 0),
              duration: Duration(milliseconds: 300),
              child: Container(
                width: width * 0.5,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateButton(bool click) {
    if (!click) {
      setState(() {
        active();
        click = true;
      });
    } else {
      setState(() {
        inActive();
        click = false;
      });
    }
  }

  void active() {
    xAlign = signInAlign;
    loginColor = selectedColor;

    signInColor = normalColor;
  }

  void inActive() {
    xAlign = loginAlign;
    loginColor = selectedColor;

    signInColor = normalColor;
  }
}
